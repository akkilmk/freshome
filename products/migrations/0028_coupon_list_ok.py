# Generated by Django 3.2 on 2021-12-27 16:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0027_remove_coupon_list_coupons'),
    ]

    operations = [
        migrations.AddField(
            model_name='coupon_list',
            name='ok',
            field=models.IntegerField(default=1),
        ),
    ]
