# Generated by Django 4.0.3 on 2022-05-06 12:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0020_alter_user_registration_user_photo_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user_registration',
            name='user_photo',
            field=models.FileField(blank=True, null=True, upload_to='images/'),
        ),
        migrations.AlterField(
            model_name='user_registration',
            name='user_resume',
            field=models.FileField(blank=True, null=True, upload_to='images/'),
        ),
    ]
