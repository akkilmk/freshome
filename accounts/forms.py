from django.db import models
from django.forms import ModelForm, fields
from django.contrib.auth.forms import UserCreationForm
from django import forms
from .models import Account


class CreateUserForm(UserCreationForm):
    class Meta:
        model = Account
        fields =['firstname','secondname','email','phone','password1','password2']