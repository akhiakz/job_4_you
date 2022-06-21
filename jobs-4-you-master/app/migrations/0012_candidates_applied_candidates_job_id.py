# Generated by Django 4.0.3 on 2022-05-05 09:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0011_candidates_applied'),
    ]

    operations = [
        migrations.AddField(
            model_name='candidates_applied',
            name='candidates_job_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='candidates_job', to='app.employer_post_vacency'),
        ),
    ]
