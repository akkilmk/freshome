# Generated by Django 3.2 on 2021-12-20 13:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0012_auto_20211217_1056'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='address_name',
            field=models.CharField(default=True, max_length=200),
        ),
    ]
