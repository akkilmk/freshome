from django import http
from django.db.models.aggregates import Count, Sum
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib import auth
from accounts.models import Account
from adminpanel.reports import deliveredorders, monthReport, pendingorders, yearReport
from products.models import Category, products,order,orderitems,coupon
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required
from django.views.decorators.cache import never_cache
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.contrib import messages
import datetime
import os
import base64
from django.core.files.base import ContentFile
# Create your views here.



#Admin login page



@never_cache
def adminlogin(request):
    if request.user.is_authenticated:
        monthReports = monthReport(request)
        yearReports = yearReport(request)
        pendingorder = pendingorders(request)
        deliveredorder = deliveredorders(request)
        report_month = order.objects.values('date__month','date__day','date__year').filter(status='Delivered').annotate(Sum('total')).order_by('-date__date')[:7]
        report_date = order.objects.values('date__month','date__day','date__year').filter(status='Delivered').annotate(Sum('total')).order_by('-date__date')[:7]
        payment_mode = order.objects.values('payment_mode').filter(status='Delivered').annotate(Sum('total')).all()
        order_status = order.objects.values('status').annotate(Count('status'))
        return render(request,'adminindex.html',{'total':report_month,'report_date':report_date,'payment':payment_mode,'order_status':order_status,'monthReports':monthReports,'yearReports':yearReports,'pendingorder':pendingorder,'deliveredorder':deliveredorder})
    else:
        return render(request,'adminlogin.html')

def adminhome(request):
    if request.user.is_authenticated:
        return render(request,'adminindex.html')
       

    if request.method == 'POST':
        adminmail = request.POST.get('adminmail')
        password = request.POST.get('password')

        user = auth.authenticate(email= adminmail,password = password)
   

        if user is not None:
            
            adminvalid = Account.objects.get(email=adminmail)
            true_admin = adminvalid.is_admin == 1 
            if true_admin is not None:

                login(request,user)
                return render(request,'adminindex.html')
            else:
                messages.info(request,'invalid credentials')
                return redirect(adminlogin)
        return redirect(adminlogin)
    return redirect(adminlogin)


@login_required(login_url='adminlogin.html')
def users(request):
    return render(request, 'pages/icons/mdi.html')


#userlist page


@login_required(login_url='adminlogin.html')
def userlist(request):
    userdetails = Account.objects.filter(is_staff=0).all()
    page = request.GET.get('page', 1)
    paginator = Paginator(userdetails,5)
    try:
        users = paginator.page(page)
    except PageNotAnInteger:
        users = paginator.page(1)
    except EmptyPage:
        users = paginator.page(paginator.num_pages)
    return render(request,'pages/tables/basic-table.html',{'users':users})


@login_required(login_url='adminlogin.html')
def block(request):

    id = request.GET.get('id')
    user = Account.objects.get(id=id)

    if user.is_active ==1:
        Account.objects.filter(id=id).update(is_active = 0)
        return redirect(userlist)
    else:
        Account.objects.filter(id=id).update(is_active = 1)
        return redirect(userlist)


# Admin Adding prodcuts


@login_required(login_url='adminlogin.html')
def addproduct(request):
    if request.method == 'POST':
        product= products()
        actual_price = request.POST.get('price')
        cat_id = request.POST.get('cat',False)
        cat_dis = Category.objects.get(id = cat_id)
        dis = cat_dis.discount
        offer_price  = int(actual_price) * dis /100
        product_name = request.POST.get('productname')
        product.product_name = request.POST.get('productname')
        product.product_price = request.POST.get('price')
        product.product_stock = request.POST.get('stock')
        product.category_id = request.POST.get('cat',False)
        images1 = request.POST.get('cropped_image1',False)
        images2 = request.POST.get('cropped_image2',False)
        images3 = request.POST.get('cropped_image3',False)
        product.offer_price = int(actual_price) - offer_price 
        product.product_description = request.POST.get('product_description')

        format, img1 = images1.split(';base64,')
        ext = format.split('/')[-1]
        product_image1 = ContentFile(base64.b64decode(img1), name= product_name + '1.' + ext)

        format, img2 = images2.split(';base64,')
        ext = format.split('/')[-1]
        product_image2 = ContentFile(base64.b64decode(img2), name= product_name + '2.' + ext)

        format, img3 = images3.split(';base64,')
        ext = format.split('/')[-1]
        product_image3 = ContentFile(base64.b64decode(img3), name= product_name + '3.' + ext)

        if len(request.FILES) != 0:
            product.product_img_1 = product_image1
        if len(request.FILES) != 0:
            product.product_img_2 = product_image2
        if len(request.FILES) != 0:
            product.product_img_3 = product_image3

        product.save()
        return redirect(allproducts)
    else:
        catego = Category.objects.all()
        
        return render(request,'addproduct.html',{'cate':catego})


# Admin logout

def adminlogout(request):
    logout(request)
    return redirect(adminlogin)


# Admin Can see product category wise

@login_required(login_url='adminlogin.html')
def showvegetables(request):
    productdetails = products.objects.filter(category=1).all()
    page = request.GET.get('page', 1)
    paginator = Paginator(productdetails, 10)
    try:
        veg_list = paginator.page(page)
    except PageNotAnInteger:
        veg_list = paginator.page(1)
    except EmptyPage:
        veg_list = paginator.page(paginator.num_pages)
    return render(request,'productinfo.html',{'veg_list':veg_list})

@login_required(login_url='adminlogin.html')
def showfruits(request):

    productdetails = products.objects.filter(category=2).all()
    return render(request,'productinfo.html',{'pds':productdetails})


@login_required(login_url='adminlogin.html')
def showfish(request):

    productdetails = products.objects.filter(category=3).all()
    return render(request,'productinfo.html',{'pds':productdetails})


#Admin can edit product here


@login_required(login_url='adminlogin.html')
def editproduct(request):
    if request.method == 'POST':
        id = request.POST.get('id')
        product = products.objects.get(id=id)
        actual_price = request.POST.get('price',False)
        cat_id = request.POST.get('cate')
        cat_dis = Category.objects.get(id = cat_id)
        dis = cat_dis.discount
        offer_price  = int(actual_price) * dis /100
        product.product_name = request.POST.get('productname',False)
        product.product_price = request.POST.get('price',False)
        product.product_stock = request.POST.get('stock',False)
        images1 = request.POST.get('cropped_image1',False)
        images2 = request.POST.get('cropped_image2',False)
        images3 = request.POST.get('cropped_image3',False)
        product_name = request.POST.get('productname')
        product.offer_price = int(actual_price) - offer_price 
        product.product_description = request.POST.get('product_description',False)
        product.category_id = request.POST.get('cate')

        if images1 is not None:
            format, img1 = images1.split(';base64,')
            ext = format.split('/')[-1]
            product_image1 = ContentFile(base64.b64decode(img1), name= product_name + '1.' + ext)

            format, img2 = images2.split(';base64,')
            ext = format.split('/')[-1]
            product_image2 = ContentFile(base64.b64decode(img2), name= product_name + '2.' + ext)

            format, img3 = images3.split(';base64,')
            ext = format.split('/')[-1]
            product_image3 = ContentFile(base64.b64decode(img3), name= product_name + '3.' + ext)

            if len(request.FILES) != 0:
                os.remove(product.product_img_1.path)
                product.product_img_1 = product_image1
            
            if len(request.FILES) != 0:
                os.remove(product.product_img_2.path)
                product.product_img_2 = product_image2
            
            if len(request.FILES) != 0:
                os.remove(product.product_img_3.path)
                product.product_img_3 = product_image3
            product.save()
            return redirect(allproducts)

        else:
            product.save()
            return redirect(allproducts)
    else:
        id=request.GET.get('id')
        product = products.objects.get(id=id)
        cates = Category.objects.all()
        return render(request, 'edit_product.html', {'product': product,'categ':cates})


#Admin can delete product


@login_required(login_url='adminlogin.html')
def deletepro(request):
    id = request.GET.get('id')

    product =products.objects.filter(id=id)

    if product:
        products.objects.filter(id=id).delete()
        
        return redirect(allproducts)
    return redirect(allproducts)

@login_required(login_url='adminlogin.html')
def allproducts(request):
    productsinfo = products.objects.all()
    page = request.GET.get('page', 1)
    paginator = Paginator(productsinfo,5)
    try:
        pro_list = paginator.page(page)
    except PageNotAnInteger:
        pro_list = paginator.page(1)
    except EmptyPage:
        pro_list = paginator.page(paginator.num_pages)
    return render(request,'allproducts.html',{'pro_list':pro_list})

@login_required(login_url='adminlogin.html')
def category(request):
    cat = Category.objects.all()
    no = Category.objects.all().count()
    lists=[]
    for i in range(1,no+1):
        lists.append(i)
        
    return render(request,'categories.html',{'cate':cat,'no':lists})

@login_required(login_url='adminlogin.html')
def addcat(request):
    if request.method =='POST':
        
        cat = Category()
        cat.category_name= request.POST.get('categoryname')
        cat.save()
        return redirect(category)

    return render(request,'addcategory.html')   

@login_required(login_url='adminlogin.html')
def editcat(request):

    
        if request.method =='POST':
            id = request.POST.get('id')
            categ = Category.objects.get(id=id)
            categ.category_name =request.POST.get('editcate')
            categ.save()
            return redirect(category)
        else:

            id=request.GET.get('id')
            categ = Category.objects.get(id=id)
            return render(request,'editcat.html',{'categ':categ})
@login_required(login_url='adminlogin.html')
def deletecat(request):
    id = request.GET.get('id')
    categ = Category.objects.filter(id=id)
    if categ:
        Category.objects.filter(id=id).delete()
        return redirect(category)
    return redirect(category)

# Admin can see Categories here


@login_required(login_url='adminlogin.html')
def viewcat(request):
    id = request.GET.get('id')
    category = Category.objects.get(id=id)
    productsinfo = products.objects.filter(category = category)
    return render(request,'viewcat.html',{'proinfo':productsinfo})



# Admin can see all orders

@login_required(login_url='adminlogin.html')
def allorders(request):
    order_details = order.objects.all().order_by('-date')
    page = request.GET.get('page', 1)
    paginator = Paginator(order_details,5)
    try:
        order_list = paginator.page(page)
    except PageNotAnInteger:
        order_list = paginator.page(1)
    except EmptyPage:
        order_list = paginator.page(paginator.num_pages)
    return render(request,'ordermanagement.html',{'order_list':order_list})


#Admin can chose an action to orderdetails 


@login_required(login_url='adminlogin.html')
def orderdetails(request):
    if request.method =="POST":
        id = request.GET.get('id')

        status = request.POST.get('status')

        if status == '1':
            order.objects.filter(id =id).update(status = 'Dispatched')
        elif status == '2':
            order.objects.filter(id =id).update(status = 'Delivered')
        elif status == '3':
            order.objects.filter(id =id).update(status = 'Rejected')
     
    id = request.GET.get('id')
    order_details = order.objects.get(id =id)
    order_id = order_details.id
    product_list = orderitems.objects.filter(order_id = order_id)
    return render(request,'order_detail.html',{'order_details':order_details,'product_list':product_list})

@login_required(login_url='adminlogin.html')
def offer(request):
    
    if request.method =='POST':
        offer_percentage = request.POST.get('offer')
        category_id = request.POST.get('apply_offer')
        category = Category.objects.get(id = category_id)
        if int(offer_percentage) > 90 or int(offer_percentage) <0:
            pass

        else:
            category.discount = offer_percentage
            category.save()
            discount = int(category.discount)/100
            productdetails = products.objects.filter(category=category_id).all()
            for i in productdetails:
                if i.special_offer !=0 :
                    pass
                else:
                    product_price=i.product_price
                    new_offer_percentage = product_price * discount
                    i.offer_price = product_price - new_offer_percentage
                    i.save()
    category = Category.objects.all()
    return render(request,'offer.html',{'category':category})

@login_required(login_url='adminlogin.html')
def coupon_details(request):
    if request.method =='POST':
        id = request.POST.get("remove_coupon")
        coupon.objects.get(id = id).delete()
    coupon_det = coupon.objects.all()
    page = request.GET.get('page', 1)
    paginator = Paginator(coupon_det,5)
    try:
        coupon_list = paginator.page(page)
    except PageNotAnInteger:
        coupon_list = paginator.page(1)
    except EmptyPage:
        coupon_list = paginator.page(paginator.num_pages)
    return render(request,'coupon.html',{'coupon_list':coupon_list})

@login_required(login_url='adminlogin.html')
def addcoupon(request):
    if request.method =='POST':
        coupon_code = request.POST.get('coupon_code')
        coupon_discount = request.POST.get('coupon_discount')
        coupon_obj = coupon()
        coupon_obj.coupon_code = coupon_code
        coupon_obj.coupon_discount = coupon_discount
        coupon_obj.save()
        return redirect(coupon_details)
    return render(request,'addcoupon.html')

