# Generated by Django 4.0.3 on 2022-05-05 07:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0006_employer_feedback_user_feedback_user_feedback_reply_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='employer_post_vacency',
            name='employer_vacency_number',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
