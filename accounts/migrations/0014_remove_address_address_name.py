# Generated by Django 3.2 on 2021-12-21 05:37

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0013_address_address_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='address',
            name='address_name',
        ),
    ]
