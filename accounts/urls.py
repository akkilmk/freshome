from os import name
from django.urls import path
from . import views

urlpatterns = [ 

    path('register',views.register,name='user_registration'),
    path('profile',views.profile,name="userprofile"),
    path('userlogout',views.userlogout,name="userlogout"),
    path('updateuser',views.updateuser,name="userupdate"),
    path('addaddress',views.addaddress,name="addressadding"),
    path('editadd',views.editaddress,name="addressediting"),
    path('deleteadd',views.deleteadd,name="addressdeletion"),
    path('phone_verification',views.phone_verification,name="phoneverify"),
    path('verify',views.token_validation,name="tokenvalidation"),
    path('verified', views.verified),
    path('userlogin',views.userlogin,name='login_page'),
    path('changepass',views.changepass,name="changepassword")
  
]