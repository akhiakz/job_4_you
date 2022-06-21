# Generated by Django 4.0.3 on 2022-05-05 10:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_candidates_applied_candidates_employer_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='candidates_applied',
            name='candidates_employer_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='candidates_employer', to='app.company_registration'),
        ),
    ]