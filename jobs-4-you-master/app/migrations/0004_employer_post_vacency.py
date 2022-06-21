# Generated by Django 4.0.3 on 2022-05-05 05:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_user_feedback'),
    ]

    operations = [
        migrations.CreateModel(
            name='employer_post_vacency',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('employer_job_title', models.CharField(blank=True, max_length=70, null=True)),
                ('employer_email', models.EmailField(blank=True, max_length=254, null=True)),
                ('employer_contact', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_experience', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_graduation', models.CharField(blank=True, max_length=100, null=True)),
                ('employer_skill1', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_skill2', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_skill3', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_skill4', models.CharField(blank=True, max_length=50, null=True)),
                ('employer_description', models.TextField()),
                ('employer_jobstatus', models.IntegerField()),
            ],
        ),
    ]