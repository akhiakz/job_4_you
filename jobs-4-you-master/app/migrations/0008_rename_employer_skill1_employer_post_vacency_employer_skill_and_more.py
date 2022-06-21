# Generated by Django 4.0.3 on 2022-05-05 07:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_employer_post_vacency_employer_vacency_number'),
    ]

    operations = [
        migrations.RenameField(
            model_name='employer_post_vacency',
            old_name='employer_skill1',
            new_name='employer_skill',
        ),
        migrations.RemoveField(
            model_name='employer_post_vacency',
            name='employer_skill2',
        ),
        migrations.RemoveField(
            model_name='employer_post_vacency',
            name='employer_skill3',
        ),
        migrations.RemoveField(
            model_name='employer_post_vacency',
            name='employer_skill4',
        ),
        migrations.AddField(
            model_name='employer_post_vacency',
            name='employer_enddate',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]