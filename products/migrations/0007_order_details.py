# Generated by Django 3.2 on 2021-12-19 04:26

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('accounts', '0012_auto_20211217_1056'),
        ('products', '0006_mycart'),
    ]

    operations = [
        migrations.CreateModel(
            name='order_details',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sumtotal', models.FloatField()),
                ('coupon', models.FloatField()),
                ('address', models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='accounts.address')),
                ('mycarts', models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='products.mycart')),
                ('products', models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='products.products')),
                ('user', models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
