# Generated by Django 3.2 on 2022-01-07 17:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0044_alter_order_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='products',
            name='special_offer',
            field=models.IntegerField(default=0),
        ),
    ]
