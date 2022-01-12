from django.contrib.auth.decorators import login_required
from django.http.response import HttpResponse
from products.models import orderitems, products,order
from django.shortcuts import redirect, render
from django.db.models.aggregates import Sum
import datetime
from django.contrib import messages
#view 


@login_required(login_url='adminlogin.html')
def salesreport(request):
     
    if request.method =='POST':
        month = request.POST.get('month')
        if month:
            month = month.split('-')
            year = month[0]
            Month = month[1]
            reportshow =2
            print(year)
            print(Month)
            totalsum = orderitems.objects.filter(order_id__status ="Delivered",order_id__date__month = Month,order_id__date__year =year).aggregate(Sum('price'))
            salesrep = orderitems.objects.values('products_id__product_name','products_id__product_price','products_id__offer_price').filter(order_id__status ="Delivered",order_id__date__month =Month,order_id__date__year =year).annotate(qty=Sum('quantity'),sum_price=(Sum('price')))
            return render(request,'report.html',{'salesreport':salesrep,'totalsum':totalsum,'reportshow':reportshow})
        else:
            date1 = request.POST.get('date1')
            date2 = request.POST.get('date2')
            salesrep = orderitems.objects.values('products_id__product_name','products_id__product_price','products_id__offer_price').filter(order_id__status ="Delivered",order_id__date__range =[date1,date2]).annotate(qty=Sum('quantity'),sum_price=(Sum('price')))
            totalsum = orderitems.objects.filter(order_id__status ="Delivered",order_id__date__range =[date1,date2]).aggregate(Sum('price'))
            date ='Date :' ' From ' + date1 + ' To ' + date2
            reportshow =2
            return render(request,'report.html',{'salesreport':salesrep,'date':date,'totalsum':totalsum,'reportshow':reportshow})
        
    reportshow =1
    return render(request,'report.html',{'reportshow':reportshow})

def productoffer(request):
    if request.method =='POST':
        product_name = request.POST.get('product_name')
        search = products.objects.filter(product_name__icontains = product_name)
        return render(request,'productoffer.html',{'proresult':search})
    return render(request,'productoffer.html')
def productofferapply(request):
    if request.method =='POST':
        offer = request.POST.get('offer')
        id = request.POST.get('apply_offer')
        proinfo = products.objects.get(id =id )
        if int(offer) <= 0 or int(offer) >= 90:
            messages.info(request,'sorry this offer not valid')
            return redirect(productoffer)
        else:
            proinfo.special_offer =  offer
            proinfo.offer_price =proinfo.product_price - proinfo.product_price * int(offer) / 100
            proinfo.save()
            return redirect(productoffer)
def monthReport(request):
    today = datetime.date.today()
    current_month = today.month
    current_year = today.year
    return order.objects.filter(date__year=current_year, date__month=current_month).aggregate(Sum('total'))
def yearReport(request):
    today = datetime.date.today()
    current_year = today.year
    return order.objects.filter(date__year=current_year).aggregate(Sum('total'))  
def pendingorders(request):
    orders = order.objects.filter(status='placed').count()
    return orders
def deliveredorders(request):
    del_orders = order.objects.filter(status='Delivered').count()
    return del_orders