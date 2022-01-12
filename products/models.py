from typing_extensions import TypeGuard
from django.db import models
import datetime
import os
from django.db.models.base import ModelState
from django.db.models.deletion import CASCADE
from django.utils import tree
from accounts.models import Account, Address



# Create your models here.
def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('', filename)



class Category(models.Model):
    category_name = models.CharField(max_length=200,default=True)
    discount = models.IntegerField(default=1)



class products(models.Model):
    product_name =  models.CharField(max_length=50)
    product_price = models.IntegerField()
    product_stock = models.IntegerField()
    product_description = models.TextField(max_length=500)
    category = models.ForeignKey(Category, default=True, on_delete=CASCADE)
    offer_price =  models.IntegerField(default=False)
    special_offer = models.IntegerField(default=0)
    product_img_1 = models.ImageField(upload_to=filepath)
    product_img_2 = models.ImageField(upload_to=filepath)
    product_img_3 = models.ImageField(upload_to=filepath)
    product_img_4 = models.ImageField(upload_to=filepath)
    product_img_5 = models.ImageField(upload_to=filepath)
  
    

class wlist(models.Model):
    products = models.ForeignKey(products,default=True,on_delete=CASCADE)
    user = models.ForeignKey(Account,default=True,on_delete=CASCADE)
    guest_user = models.CharField(max_length=150,default=True)

class mycart(models.Model):
    user = models.ForeignKey(Account,default=True,on_delete=CASCADE)
    products = models.ForeignKey(products,default=True,on_delete=CASCADE)
    total = models.IntegerField()
    quantity = models.IntegerField()
    grand_total =models.FloatField(default=True)
    coupon_discount = models.CharField(max_length=50,default=0)
    discount_total = models.CharField(max_length=50,default=00)
    guest_user = models.CharField(max_length=150,default=True)

class order(models.Model):
    user = models.ForeignKey(Account,on_delete=CASCADE)
    address = models.ForeignKey(Address,default=True,on_delete=CASCADE)
    payment_mode = models.CharField(max_length=100)
    status = models.CharField(max_length=100,default="placed")
    total = models.FloatField()
    date = models.DateTimeField(auto_now_add=True) 

class orderitems(models.Model):
    order = models.ForeignKey(order,on_delete=CASCADE)
    products = models.ForeignKey(products,on_delete=CASCADE)
    quantity = models.IntegerField()
    price = models.FloatField()

class coupon(models.Model):
    coupon_code = models.CharField(max_length=50)
    coupon_discount = models.FloatField()
    coupon_is_active = models.IntegerField(default=1)
    
class coupon_list(models.Model):
    cart_sum = models.CharField(max_length=50)
    coupon_discount = models.CharField(max_length=50)
    grand_total = models.CharField(max_length=50)
    status = models.IntegerField(default=1)
    user = models.ForeignKey(Account,on_delete=CASCADE,default=True)
    coupon_use = models.ForeignKey(coupon,on_delete=CASCADE,default=True)
    
  
    
    
    

    