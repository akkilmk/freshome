# Generated by Django 3.2 on 2022-01-05 08:50

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0042_orderitems_date'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='orderitems',
            name='date',
        ),
    ]
