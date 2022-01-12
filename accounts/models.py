
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models
from django.contrib.auth.models import PermissionsMixin
from django.db.models.base import ModelState
from django.db.models.deletion import CASCADE

# from grocery.views import address

class AccountManager(BaseUserManager):
    def create_user(self, firstname,secondname, email, phone, password=None):
        if not email:
            raise ValueError('You must have an email')

        user = self.model(
            email = self.normalize_email(email),
            firstname = firstname,
            secondname = secondname,
            phone = phone,
            is_active = 1,
        )

        user.set_password(password)
        user.save(using=self._db)
        self.phone = phone
        return user


    def create_superuser(self,email,password=None):
      
        superuser = self.model(
            email = self.normalize_email(email),
            
            is_active =1,
            is_superuser =1,
            is_staff = 1,
          
        )
        superuser.set_password(password)
        superuser.save(using=self._db)
        return superuser

class Account(AbstractBaseUser,PermissionsMixin):
    
    firstname = models.CharField(max_length=50)
    secondname = models.CharField(max_length=50)
    email = models.CharField(max_length=50,unique=True)
    phone = models.CharField(max_length=50,unique=True)
    date_joined = models.DateTimeField(auto_now_add=True)
    last_login = models.DateTimeField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    create_superuser = models.CharField(max_length=100,default=True)





    USERNAME_FIELD='email'

    REQUIRED_FIELD = ['firstname','secondname', 'email', 'phone', 'password']

    objects = AccountManager()

class Address(models.Model):
    user = models.ForeignKey(Account,on_delete=CASCADE)
    user_name = models.CharField(max_length=50,blank=True)
    city = models.CharField(max_length=50)
    zip_code = models.IntegerField()
    address = models.CharField(max_length=200)
    phone = models.BigIntegerField()
    is_active = models.IntegerField(default=False)



