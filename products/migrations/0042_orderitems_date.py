# Generated by Django 3.2 on 2022-01-03 10:40

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0041_auto_20211228_0544'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderitems',
            name='date',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
