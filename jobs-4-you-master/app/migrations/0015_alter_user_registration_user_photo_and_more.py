# Generated by Django 4.0.3 on 2022-05-05 12:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0014_alter_candidates_applied_candidates_employer_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user_registration',
            name='user_photo',
            field=models.FileField(blank=True, null=True, upload_to='media/user_image/'),
        ),
        migrations.AlterField(
            model_name='user_registration',
            name='user_resume',
            field=models.FileField(blank=True, null=True, upload_to='media/user_resume/'),
        ),
    ]