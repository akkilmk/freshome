
from django.contrib import messages
from django.db.models import query
from django.db.models.aggregates import Sum
from django.http.response import HttpResponse, JsonResponse
from accounts.models import Account, Address
from adminpanel.views import category, offer
from products.models import coupon, order, products,wlist,mycart,orderitems,coupon_list
from django.shortcuts import redirect, render, resolve_url
from django.contrib.auth.decorators import login_required, permission_required
from accounts import guest_user, views as accviews
from freshome.settings import RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY
import razorpay

# from accounts.models import Account


# Create your views here.


                 #home_page

def home(request):                      
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        user_id = user_email.id
        mycart_count = mycart.objects.filter(user_id = user_id).count()
        productfruits = products.objects.filter(category_id = 7).all()[:6]
        productveg = products.objects.filter(category_id = 8).all()[:6]
        fish = products.objects.filter(category_id = 9).all()[:6] 
        return render(request,'index.html',{'fruits':productfruits,'vegetables':productveg ,'fish':fish,'user_name':user_name,'mycart_count':mycart_count })

    productfruits = products.objects.filter(category_id = 7).all()[:6]
    productveg = products.objects.filter(category_id = 8).all()[:6]
    fish = products.objects.filter(category_id = 9).all()[:6]
    return render(request,'index.html',{'fruits':productfruits,'vegetables':productveg ,'fish':fish })


                 #product_detailing page
    
def productdec(request, id):                 
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        user_id = user_email.id
        mycart_count = mycart.objects.filter(user_id = user_id).count()
        product = products.objects.filter(id=id)
        return render(request, 'prodescription.html',{'prodec':product,'user_name':user_name,'mycart_count':mycart_count})

    product = products.objects.filter(id=id)
    return render(request, 'prodescription.html',{'prodec':product})

                #mycart

def mycarts(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        user_id = user_email.id
        mycart_count = mycart.objects.filter(user_id = user_id).count()
        user_email =Account.objects.get(email = useremail)
        user_id=user_email.id
        cartdec = mycart.objects.filter(user_id=user_id)
        cartsum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total'))
        return render(request,'mycart.html',{'cartdetails':cartdec,'cartsum':cartsum,'user_name':user_name,'mycart_count':mycart_count})
    else:
        if guest_user:
            cartdec = mycart.objects.filter(guest_user = guest_user)
            mycart_count = mycart.objects.filter(guest_user = guest_user).count()
            cartsum = mycart.objects.filter(guest_user = guest_user).aggregate(Sum('total'))
            return render(request,'mycart.html',{'cartdetails':cartdec,'cartsum':cartsum,'user_name':"Annonymous",'mycart_count':mycart_count})


            #add_products_to_cart_fuction 

def addtocart(request,id):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    product = products.objects.get(id=id)
    products_price = product.offer_price

    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id = user_email.id
        my_cart_id = mycart.objects.filter(products_id = id,user_id = user_id)

        if my_cart_id:
            return JsonResponse({ 'status' : 'fail'})
        else:
            mycart(products_id = id,user_id = user_id,quantity = 1, total = products_price).save()
            count = mycart.objects.filter(user_id = user_id).count()
            return JsonResponse({ 'status' : 'success','count':count})
    else:
        if guest_user:
            my_cart_id = mycart.objects.filter(products_id = id,guest_user = guest_user)
            if my_cart_id:
                return JsonResponse({ 'status' : 'fail'})
            else:
                mycart(products_id = id,guest_user = guest_user,quantity = 1, total = products_price).save()
                count = mycart.objects.filter(guest_user = guest_user).count()
                return JsonResponse({ 'status' : 'success','count':count})

def plusquantity(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    id = request.GET.get('id')
    cart = mycart.objects.get(id=id)
    if 'usermail' in request.session:
        product_id=cart.products_id
        prodcut_stock = products.objects.get(id = product_id)
        cart.quantity = cart.quantity + 1
        if prodcut_stock.product_stock+1 != cart.quantity:
            cart.total = cart.total + cart.products.offer_price
            cart.save()
            useremail = request.session['usermail']
            user_email =Account.objects.get(email = useremail)
            user_id=user_email.id
            cartsum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total')) 
            return JsonResponse({ 'status' : 'success', 'newQuantity' : cart.quantity , 'cartTotal' : cart.total, 'cartsum' : cartsum })
    else:
        if guest_user:
            product_id=cart.products_id
            prodcut_stock = products.objects.get(id = product_id)
            cart.quantity = cart.quantity + 1
            if prodcut_stock.product_stock+1 != cart.quantity:
                cart.total = cart.total + cart.products.offer_price
                cart.save()
                cartsum = mycart.objects.filter(guest_user=guest_user).aggregate(Sum('total')) 
                return JsonResponse({ 'status' : 'success', 'newQuantity' : cart.quantity , 'cartTotal' : cart.total, 'cartsum' : cartsum })

def minusquantity(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    id = request.GET.get('id')
    cart = mycart.objects.get(id=id)
    if 'usermail' in request.session:
        if cart.quantity == 1 :
            mycart.objects.filter(id=id).delete()
            useremail = request.session['usermail']
            user_email =Account.objects.get(email = useremail)
            user_id=user_email.id
            cartsum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total')) 
            return JsonResponse({ 'status' : 'success', 'newQuantity' : 0 , 'cartTotal':cart.total, 'cartsum' : cartsum  })
            
        else:
            
            cart.quantity = cart.quantity - 1
            cart.total = cart.total - cart.products.offer_price
            cart.save()
            useremail = request.session['usermail']
            user_email =Account.objects.get(email = useremail)
            user_id=user_email.id
            cartsum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total')) 
            return JsonResponse({ 'status' : 'success', 'newQuantity' : cart.quantity, 'cartTotal':cart.total, 'cartsum' : cartsum })
    else:
        if guest_user:
            if cart.quantity == 1 :
                mycart.objects.filter(id=id).delete()
                cartsum = mycart.objects.filter(guest_user=guest_user).aggregate(Sum('total')) 
                return JsonResponse({ 'status' : 'success', 'newQuantity' : 0 , 'cartTotal':cart.total, 'cartsum' : cartsum  })
            else:
                cart.quantity = cart.quantity - 1
                cart.total = cart.total - cart.products.offer_price
                cart.save()
                cartsum = mycart.objects.filter(guest_user=guest_user).aggregate(Sum('total')) 
                return JsonResponse({ 'status' : 'success', 'newQuantity' : cart.quantity, 'cartTotal':cart.total, 'cartsum' : cartsum })




def deletequantity(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    id = request.GET.get('id')
    if 'usermail' in request.session:
        mycart.objects.filter(id=id).delete()
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id=user_email.id
        cartdec = mycart.objects.filter(user_id=user_id)
        cartsum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total'))
        count = mycart.objects.filter(user_id = user_id).count()
        return JsonResponse({ 'status' : 'success','cartsum':cartsum,'count':count })
    else:
        if guest_user:
            mycart.objects.filter(id=id).delete()
            cartsum = mycart.objects.filter(guest_user=guest_user).aggregate(Sum('total'))
            count = mycart.objects.filter(guest_user = guest_user).count()
            return JsonResponse({ 'status' : 'success','cartsum':cartsum,'count':count })




        # wishlist CURD operations


def whishlist(request, id):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id=user_email.id
        add_wish = wlist()
        id_wish = wlist.objects.filter(products_id=id,user_id = user_id) 

        if id_wish :
            if request.GET.get('next'):
                next = request.GET.get('next')
                return redirect(next)
            else:
                return JsonResponse({ 'status' : 'fail'})               
        else:
            add_wish.products_id = id
            add_wish.user_id = user_id
            add_wish.save()
            if request.GET.get('next'):
                next = request.GET.get('next')
                return redirect(next) 
            else:
                return JsonResponse({ 'status' : 'success'})
    else:
        if guest_user:
            add_wish = wlist()
            id_wish = wlist.objects.filter(products_id=id,guest_user = guest_user) 

            if id_wish :
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next)
                else:
                    return JsonResponse({ 'status' : 'fail'})               
            else:
                add_wish.products_id = id
                add_wish.guest_user = guest_user
                add_wish.save()
                if request.GET.get('next'):
                    next = request.GET.get('next')
                    return redirect(next) 
                else:
                    return JsonResponse({ 'status' : 'success'})

   
def address(request):
    if 'usermail' not in request.session:
        return redirect(accviews.userlogin)
    else:
        return render(request, 'address.html')


                 #wishlist page


def wishlist(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        user_id=user_email.id
        wishpro = wlist.objects.filter(user_id = user_id)
        count = mycart.objects.filter(user_id = user_id).count()
        return render(request,'whishlist.html',{'wishpro':wishpro,'mycart_count':count,'user_name':user_name})
    else:
        if guest_user:
            wishpro = wlist.objects.filter(guest_user = guest_user)
            count = mycart.objects.filter(guest_user = guest_user).count()
            return render(request,'whishlist.html',{'wishpro':wishpro,'mycart_count':count,'user_name':"Anonimous"})




def deletewish(request):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    id = request.GET.get('id')
    if 'usermail' in request.session:
        wlist.objects.filter(id=id).delete()
        return JsonResponse({ 'status' : 'success' })
    else:
        if guest_user:
            wlist.objects.filter(id=id).delete()
            return JsonResponse({ 'status' : 'success' })



def cartfromwhish(request,id):
    device = request.COOKIES['device']  
    request.session['device'] = device
    guest_user = request.session['device']
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id = user_email.id
        my_cart_id = wlist.objects.get(id = id)
        products_price = my_cart_id.products.product_price 
        product_id = my_cart_id.products_id

        exist_product = mycart.objects.filter(products = product_id,user_id =user_id)

        if exist_product:
           
            wlist.objects.filter(id=id).delete()
            if request.GET.get('next'):
                next = request.GET.get('next')
                return JsonResponse({ 'status' : 'fail' })
        else:
            mycart(products_id = product_id,user_id = user_id,quantity = 1, total = products_price).save()
            wlist.objects.filter(id=id).delete()
            if request.GET.get('next'):
                next = request.GET.get('next')
                count = mycart.objects.filter(user_id = user_id).count()
                return JsonResponse({ 'status' : 'success','count':count })
    else:
        if guest_user:
            my_cart_id = wlist.objects.get(id = id)
            products_price = my_cart_id.products.product_price 
            product_id = my_cart_id.products_id

            exist_product = mycart.objects.filter(products = product_id,guest_user =guest_user)

        if exist_product:
           
            wlist.objects.filter(id=id).delete()
            if request.GET.get('next'):
                next = request.GET.get('next')
                return JsonResponse({ 'status' : 'fail' })
        else:
            mycart(products_id = product_id,guest_user = guest_user,quantity = 1, total = products_price).save()
            wlist.objects.filter(id=id).delete()
            if request.GET.get('next'):
                next = request.GET.get('next')
                count = mycart.objects.filter(guest_user = guest_user).count()
                return JsonResponse({ 'status' : 'success','count':count })



                # checkout _CURD operations and Checkout page and success page


def checkout(request):
    if 'usermail' not in request.session:
        messages.info(request,'sorry you must login first')
        return redirect(accviews.userlogin)
    else:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id=user_email.id
        coupon_lists =  coupon_list()
        cart_sum = mycart.objects.filter(user_id=user_id).aggregate(Sum('total'))
        caa = list(cart_sum.values())
        for i in caa:
            total_sum = i
        if total_sum == 0:
            messages.info(request,'Please add cart least one product')
            return redirect(mycarts)
        else:


            mycart.objects.filter(user_id=user_id).update(grand_total = total_sum)
            lastest_cart= mycart.objects.filter(user_id = user_id).latest('coupon_discount')
            lastest=lastest_cart.coupon_discount
            grand_total = lastest_cart.grand_total
            cartsum = int(grand_total) - float(lastest)
            user_name=user_email.firstname
            mycart_count = mycart.objects.filter(user_id = user_id).count()
            
            if request.method =='POST':
                address = request.POST.get('active_add')
                if address is None:
                    messages.info(request,'please fill the Address form')
                    return redirect(checkout)
                else:
                    total = request.POST.get('total_amt')
                    cod = request.POST.get('payment')
                    offer_details = coupon_list.objects.latest('id')
                    orders = order()
                    orders.user_id = user_id
                    orders.address_id = address
                    orders.total = offer_details.grand_total
                    orders.payment_mode =cod
                    orders.save()
                    mycarts_items = mycart.objects.filter(user_id = user_id).all()
                    last_id = order.objects.filter(user_id = user_id).latest('id')
                    for i in mycarts_items:
                        order_items = orderitems()
                        order_items.order_id = last_id.id
                        order_items.products_id = i.products_id
                        order_items.quantity = i.quantity
                        order_items.price = i.total
                        order_items.save()
                        product_id = i.products_id
                        product_dec = products.objects.get(id  = product_id)
                        product_dec.product_stock = product_dec.product_stock - i.quantity
                        product_dec.save()
                        mycart.objects.filter(user_id = user_id).delete()
                    coupon_last =  coupon_list.objects.filter(user_id = user_id).last()
                    order_id = order.objects.filter(user_id = user_id).latest('id')
                    order_details = orderitems.objects.filter(order_id = order_id)
                    coupon_lists.status = 0
                    coupon_lists.user_id = user_id
                    coupon_lists.coupon_use_id = coupon_last.coupon_use_id
                    coupon_lists.save()
                    return render(request,'success.html',{'order_details':order_details,'subtotal':cartsum,'user_name':user_name,'mycart_count':mycart_count})
                
            else:
                cartdec = mycart.objects.filter(user_id=user_id) 
                address = Address.objects.filter(user_id = user_id,is_active = 0)
                coupon_lists.cart_sum = cartsum
                coupon_lists.coupon_discount = 0
                coupon_lists.grand_total = total_sum
                coupon_lists.user_id = user_id
                coupon_lists.save()
                return render(request,'checkout.html',{'cartdetails': cartdec,'lastest_coupon':lastest,'subtotal':cartsum ,'grand_total':grand_total,
                'address':address,'user_name':user_name,'mycart_count':mycart_count})
    
                    #buy now option and success page


def buynow(request):
    id = request.GET.get('id')
    if 'usermail' not in request.session:
        messages.info(request,'sorry you must login first')
        return redirect(accviews.userlogin)
    else:
        useremail = request.session['usermail'] 
        user_email =Account.objects.get(email = useremail)
        user_id=user_email.id
        user_name=user_email.firstname
        productdec = products.objects.get(id = id)
        if request.method =='POST':
            address = request.POST.get('active_add')
            if address is None:
                messages.info(request,'please fill the Address form')
                return redirect('/buynow?id='+id)
            else:
                cod = request.POST.get('payment')
                orders = order()
                orders.user_id = user_id
                orders.address_id = address
                orders.total = productdec.offer_price
                orders.payment_mode =cod
                orders.save()
                last_id = order.objects.filter(user_id = user_id).latest('id')
                order_items = orderitems()
                order_items.order_id = last_id.id
                order_items.products_id = productdec.id
                order_items.quantity = 1
                order_items.price = productdec.offer_price
                order_items.save()
                cartsum = productdec.offer_price
                mycart_count = mycart.objects.filter(user_id = user_id).count()
                order_id = order.objects.filter(user_id = user_id).latest('id')
                order_details = orderitems.objects.filter(order_id = order_id)
                return render(request,'success.html',{'order_details':order_details,'buynowtotal':cartsum,'user_name':user_name,'mycart_count':mycart_count})
        address = Address.objects.filter(user_id = user_id ,is_active = 0)
        coupon_lists =  coupon_list()
        coupon_lists.grand_total = productdec.offer_price
        coupon_lists.user_id =user_id
        grand_total = productdec.offer_price
        coupon_lists.save()
        return render(request,'checkout.html',{'address':address,'prodetails':productdec,'buynow':1,'grand_total':grand_total,'buynowadd':id})


        # Razorpay

def razorpay_option(request):
    useremail = request.session['usermail'] 
    user_email =Account.objects.get(email = useremail)
    user_id=user_email.id
    coupon_lists =  coupon_list.objects.filter(user_id = user_id).last()
    sum_total = coupon_lists.grand_total
    sum_totals = float(sum_total)
    client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))
    sum_totals = sum_totals * 100
    DATA = {
        "amount": sum_totals,
        "currency": "INR",
        "receipt": "receipt#1",
        "notes": {
            "key1": "value3",
            "key2": "value2"
        }
    }
    orders = client.order.create(data=DATA)
    ordersid = orders['id']
    return JsonResponse({ 'status' : 'success','ordersid':ordersid })


        #coupon



def applycoupon(request):
    useremail = request.session['usermail']
    user_email = Account.objects.get(email = useremail)
    user_id=user_email.id
    lastest_cart= mycart.objects.filter(user_id = user_id).latest('coupon_discount')
    grand_total = lastest_cart.grand_total
    coupon_codes = request.GET.get('coupon_code')
    coupons_ok = coupon.objects.filter(coupon_code = coupon_codes)
        
    if grand_total <1000 :
        return JsonResponse({ 'status' : 'fail_amount'})
    elif coupons_ok:
        coupons = coupon.objects.get(coupon_code = coupon_codes)
        if coupons:
            is_used_coupon = coupon_list.objects.filter(coupon_use_id = coupons,user_id = user_id,status = 0).all()
            if is_used_coupon:
                return JsonResponse({ 'status' : 'fail_coupon_exists'})
            else:
                coupon_discount=coupons.coupon_discount
                total_discount = grand_total * coupon_discount /100
                grand_totals = grand_total - total_discount
                coupon_lists=coupon_list()
                coupon_lists.grand_total = grand_totals
                coupon_lists.coupon_discount = total_discount
                coupon_lists.user_id = user_id
                coupon_lists.coupon_use_id = coupons.id
                coupon_lists.save()
                
                mycart.objects.filter(user_id=user_id).update(discount_total = grand_totals,coupon_discount = total_discount)
                return JsonResponse({ 'status' : 'success','discount':total_discount,'grand_total':grand_totals})
    else:
        return JsonResponse({ 'status' : 'fail_invalid_coupon'})


        # Categories wise view


def full_veg(request):
    productveg = products.objects.filter(category_id = 8).all()
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        return render(request,'full_veg.html',{'veg':productveg,'user_name':user_name})
    else:
        return render(request,'full_veg.html',{'veg':productveg})
def full_fruit(request):
    productfruits = products.objects.filter(category_id = 7).all()
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        return render(request,'full_fruits.html',{'full_fruits':productfruits,'user_name':user_name})
    else:
        return render(request,'full_fruits.html',{'full_fruits':productfruits})
def full_fish(request):
    fish = products.objects.filter(category_id = 9).all()
    if 'usermail' in request.session:
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_name=user_email.firstname
        return render(request,'full_fish.html',{'full_fish':fish,'user_name':user_name})
    else:
        return render(request,'full_fish.html',{'full_fish':fish})

 
            
def search(request):
    if request.method =='POST':
        search_item = request.POST.get('search_products')
        search = products.objects.filter(product_name__icontains = search_item)
        if 'usermail' in request.session:
            useremail = request.session['usermail']
            user_email =Account.objects.get(email = useremail)
            user_name=user_email.firstname
            return render(request,'search.html',{'search_items':search,'user_name':user_name})
        else:
            return render(request,'search.html',{'search_items':search})

            
    