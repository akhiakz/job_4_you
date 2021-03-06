# Generated by Django 4.0.3 on 2022-05-05 06:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0005_employer_post_vacency_employer_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='employer_feedback',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employer_feedback_name', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_feedback_email', models.EmailField(blank=True, max_length=254, null=True)),
                ('employer_feedback_type', models.CharField(max_length=50, null=True)),
                ('employer_feedback_message', models.TextField(blank=True, null=True)),
                ('employer_feedback_reply', models.CharField(blank=True, max_length=200, null=True)),
                ('employer_feedback_status', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.AddField(
            model_name='user_feedback',
            name='user_feedback_reply',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='user_feedback',
            name='user_feedback_status',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
