# Generated by Django 3.2 on 2021-12-27 16:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0029_remove_coupon_list_ok'),
    ]

    operations = [
        migrations.AddField(
            model_name='coupon_list',
            name='coupon',
            field=models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='products.coupon'),
        ),
    ]
