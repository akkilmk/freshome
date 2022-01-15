

from django import http
from django.forms.widgets import EmailInput
from django.http import response
from django.shortcuts import redirect, render
from django.contrib import auth

from accounts import guest_user
from . models import Account, Address
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required

from products.models import Category, products,order,orderitems,mycart, wlist
from . forms import CreateUserForm
from django.contrib import messages
from grocery import views as groview
from django.shortcuts import render, redirect

from . import twilio_client

# Create your views here.


        # user login page


def userlogin(request):
    if 'usermail' in request.session:
        return redirect(groview.home)
    else:
        if request.method == 'POST':
            email = request.POST.get('email')
            password = request.POST.get('password')
            user = auth.authenticate(email= email,password = password)
            if user:
                request.session['usermail'] = email
                messages.success(request,'welcome to freshome')
                return redirect(groview.home)             
            else:
                messages.success(request,'Invalid creditials')    
                return render(request,'login.html')
        return render(request,'login.html')


                #user Registration page 

def register(request):
    if 'usermail' in request.session:
        return redirect(groview.home)
    else:
        device = request.COOKIES['device']
        is_guest = mycart.objects.filter(guest_user = device)
        is_guest_wish = wlist.objects.filter(guest_user = device)
        form = CreateUserForm()
        if request.method =='POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                user_id = Account.objects.latest('id')
                user = form.cleaned_data.get('firstname')
                email = form.cleaned_data.get('email')
                if is_guest:
                    if is_guest_wish:
                        mycart.objects.filter(guest_user = device).update(user_id = user_id)
                        wlist.objects.filter(guest_user = device).update(user_id = user_id)
                        messages.success(request,'Account successfully created for '+ user)
                        request.session['usermail'] = email
                        return redirect(groview.home)
                    else:
                        user = form.cleaned_data.get('firstname')
                        email = form.cleaned_data.get('email')
                        mycart.objects.filter(guest_user = device).update(user_id = user_id)
                        messages.success(request,'Account successfully created for '+ user)
                        request.session['usermail'] = email
                        return redirect(groview.home)
                elif is_guest_wish:
                    wlist.objects.filter(guest_user = device).update(user_id = user_id)
                    messages.success(request,'Account successfully created for '+ user)
                    request.session['usermail'] = email
                    return redirect(groview.home)
                else:
                    messages.success(request,'Account successfully created for '+ user)
                    request.session['usermail'] = email
                    return redirect(groview.home)
        context ={'form':form}
        return render(request,'registration.html',context)


        #User logout


def userlogout(request):
    logout(request)
    return redirect(groview.home)


        #User Profile


def profile(request):
    if 'usermail' not in request.session:
        return redirect(userlogin)
    else:

        if request.method == 'POST':
            statu = request.POST.get('status')
            order.objects.filter(id =statu).update(status = 'customer cancelled')

        userdetails = request.session['usermail']
        user = Account.objects.get(email = userdetails)
        useremail = request.session['usermail']
        user_email =Account.objects.get(email = useremail)
        user_id = user.id
        user_name=user_email.firstname
        userid = user_email.id
        mycart_count = mycart.objects.filter(user_id = userid).count()
        useradd = Address.objects.filter(user_id = user_id).all()
        order_details = order.objects.filter(user_id = user_id).order_by('-date')
        products_details = orderitems.objects.all()
       
        return render(request,'profile.html',{'userdeatils':user,'useraddress':useradd,'order_details':order_details,'products_details':products_details,'mycart_count':mycart_count,'user_name':user_name})


        #Updation of user Informations


def updateuser(request):
    if 'usermail' not in request.session:
        return redirect(userlogin)
    else:
        useremail = request.session['usermail']
        useracc = Account.objects.get(email =useremail)

        if request.method =='POST':
            firstname = request.POST.get('firstname')
            secondname = request.POST.get('secondname')
            email = request.POST.get('email')
            phone = request.POST.get('phone')
            Account.objects.filter(id=useracc.id).update(firstname = firstname,secondname =secondname,email =email,phone =phone)
            return redirect(profile)

def changepass(request):
    if 'usermail' in request.session:
        return redirect(groview.home)
    else:
        if request.method =="POST":
            useremail = request.session['usermail']
            current_password = request.POST.get('currentpass')
            newpass1 = request.POST.get('pass1')
            newpass2 = request.POST.get('pass2')
            if newpass1 == newpass2 :
                is_valid_pass = authenticate(email = useremail,password = current_password)
                if is_valid_pass:
                    updates = Account.objects.get(email=useremail)
                    updates.set_password(newpass2)
                    updates.save()
                    return redirect(profile)


                #User Address updation


def addaddress(request):
    if 'usermail' not in request.session:
        return redirect(userlogin)
    else:
        if request.method =='POST':
            name = request.POST.get('name')
            city = request.POST.get('city')
            phone = request.POST.get('phone')
            address = request.POST.get('address')
            zip_code =request.POST.get('zipcode')
            fromcheckout = request.POST.get('fromcheckout')
            frombuynow =request.POST.get('buynowcheckout')
            userdetails = request.session['usermail']
            user = Account.objects.get(email = userdetails)
            user_id = user.id
            Address(user_name=name,city=city,phone=phone,zip_code=zip_code,address=address,user_id=user_id).save()
            if fromcheckout == '1':
                return redirect(groview.checkout)
            elif fromcheckout == '0':
                return redirect('/buynow?id='+frombuynow)
            else:
                return redirect(profile)
        else:
            useremail = request.session['usermail']
            user_email =Account.objects.get(email = useremail)
            user_name=user_email.firstname
            user_id = user_email.id
            mycart_count = mycart.objects.filter(user_id = user_id).count()
            return render(request,'addaddress.html',{'user_name':user_name,'mycart_count':mycart_count})


            #User can edit Address


def editaddress(request):
    if 'usermail' not in request.session:
        return redirect(userlogin)
    else:
        if request.method =='POST':
            id =request.GET.get('id') 
            usadd = Address.objects.get(id=id)
            usadd.user_name = request.POST.get('name')
            usadd.city = request.POST.get('city')
            usadd.phone = request.POST.get('phone')
            usadd.address = request.POST.get('address')
            usadd.zip_code =request.POST.get('zipcode')
            usadd.save()
            return redirect(profile)
        else:
            id =request.GET.get('id') 
            usadd = Address.objects.get(id=id)

        return render(request,'editaddress.html',{'useraddress':usadd})


            #User can delete Address


def deleteadd(request):
    if 'usermail' not in request.session:
        return redirect(userlogin)
    else:
        id = request.GET.get('id')
        Address.objects.get(id=id).delete()
        return redirect(profile)


        #User phone verification using twilio 


def phone_verification(request):
    if request.method == 'POST':
        phonenum = request.POST.get('phone')
        user_valid = Account.objects.filter(phone = phonenum)
        if user_valid:
            phone = '+91'+request.POST.get('phone')
            request.session['phone_number'] = phonenum
            twilio_client.verifications(phone, 'sms')
            return redirect(token_validation)
        else:
            messages.success(request,'Invalid phone number')
            return render(request, 'forgot.html')
    else:
        
        return render(request, 'forgot.html')


def token_validation(request):
    if request.method == 'POST':
        verification = twilio_client.verification_checks('+91'+request.session['phone_number'], request.POST.get('otp'))
        if verification is None:
            messages.success(request,'Invalid OTP')
            return redirect(phone_verification)
        elif verification.status == 'approved':
            request.session['is_verified'] = True
            return redirect(verified)
        else:
            messages.success(request,'Invalid OTP')
            return redirect(token_validation)
    else:
        
        return render(request, 'token_validation.html')


def verified(request):
    if not request.session.get('is_verified'):
        return redirect(phone_verification)
    phone = request.session['phone_number']   
    user = Account.objects.get(phone=phone) 
    request.session['usermail'] = user.email
    return redirect(groview.home)
