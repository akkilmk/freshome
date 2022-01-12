from os import name
from django.urls import path

from adminpanel import reports 
from . import views


urlpatterns = [ 
    path('',views.adminlogin,name="home"),
    path('adminhome',views.adminhome,name="adminhome"),
    path('users',views.users,name='list_users'),
    path('userslist',views.userlist,name="user_table"),
    path('block',views.block,name="block_user"),
    path('addproduct',views.addproduct,name="product_to_database"),
    path('adminlogout',views.adminlogout,name="logout"),
    path('vegetables',views.showvegetables,name="fullvegetables"),
    path('fruits',views.showfruits,name="all_fruits"),
    path('fish',views.showfish,name="full_fish"),
    path('editpro',views.editproduct,name="edit_product"),
    path('deletepro',views.deletepro,name="delete the product"),
    path('allproducts',views.allproducts),
    path('categories',views.category),
    path('addcategory',views.addcat),
    path('editcat',views.editcat),
    path('deletecat',views.deletecat),
    path('viewcat',views.viewcat),
    path('order',views.allorders),
    path('orderdetails',views.orderdetails),
    path('offer',views.offer),
    path('coupon',views.coupon_details),
    path('addcoupon',views.addcoupon),
    path('salesreport',reports.salesreport),
    path('productoffer',reports.productoffer),
    path('productofferapply',reports.productofferapply)
  
  
]