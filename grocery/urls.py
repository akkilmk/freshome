from django.urls import re_path
from django.urls import path
from django.urls.resolvers import URLPattern
from . import views

urlpatterns = [ 
    path('',views.home,name="home"),
    path('mycart',views.mycarts),
    re_path(r'^whishlist/(?P<id>\w+)', views.whishlist),
    re_path(r'^productdetails/(?P<id>\w+)', views.productdec),
    path('addadd',views.address),
    path('wishlists',views.wishlist),
    path('deletewish',views.deletewish),
    re_path(r'^addtocart/(?P<id>\w+)',views.addtocart),
    path('plusquantity',views.plusquantity),
    path('minusquantity',views.minusquantity),
    path('deletequantity',views.deletequantity),
    re_path(r'^cartfromwhish/(?P<id>\w+)',views.cartfromwhish),
    path('checkout',views.checkout),
    path('buynow',views.buynow),
    path('applycoupon',views.applycoupon),
    path('full_vegetables',views.full_veg),
    path('full_fruits',views.full_fruit),
    path('full_fish',views.full_fish),
    path('razorpay',views.razorpay_option),
    path('searching',views.search)
   
]