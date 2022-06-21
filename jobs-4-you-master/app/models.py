from django.db import models
from django.contrib.auth.models import User
from django.db.models import JSONField

# Create your models here.

class user_registration(models.Model):
    user_fullname = models.CharField(max_length=70,null=True,blank=True)
    user_age = models.IntegerField(null=True, blank=True)
    user_education = models.CharField(max_length=50, null=True,blank=True)
    user_experience = models.CharField(max_length=50, null=True, blank=True)
    user_email = models.EmailField(max_length=50,null=True, blank=True)
    user_contact = models.IntegerField(null=True, blank=True)
    user_gender = models.CharField(max_length=20,null=True, blank=True)
    user_city = models.CharField(max_length=30,null=True, blank=True)
    user_photo = models.FileField(upload_to='images/', null=True, blank=True)
    user_resume = models.FileField(upload_to='images/', null=True, blank=True)
    user_password = models.CharField(max_length=50, null=True, blank=True)

class company_registration(models.Model):
    company_name = models.CharField(max_length=50,null=True, blank=True)
    company_address = models.TextField(null=True, blank=True)
    company_description = models.TextField(null=True, blank=True)
    company_city = models.CharField(max_length=50, null=True, blank=True)
    company_website = models.URLField(null=True, blank=True)
    company_email = models.EmailField(null=True, blank=True)
    company_contact = models.IntegerField(null=True, blank=True)
    company_logo = models.FileField(upload_to='images/', null=True, blank=True)
    company_password = models.CharField(max_length=50, null=True, blank=True)
    company_status = models.IntegerField(null=True, blank=True)

class user_feedback(models.Model):
    user_feedback = models.ForeignKey(user_registration,on_delete = models.SET_NULL,related_name="user_feedback_view",null=True, blank=True)
    user_feedback_name = models.CharField(max_length=50, null=True, blank=True)
    user_feedback_email = models.EmailField(null=True, blank=True)
    user_feedback_profession = models.CharField(max_length=50, null=True)
    user_feedback_message = models.TextField(null=True, blank=True)
    user_feedback_reply = models.CharField(max_length=200, null=True, blank=True)
    user_feedback_status = models.IntegerField(null=True, blank=True)

class employer_feedback(models.Model):
    employer_feedback_id = models.ForeignKey(company_registration,on_delete = models.SET_NULL,related_name="employer_feedback_view",null=True, blank=True)
    employer_feedback_name = models.CharField(max_length=50, null=True, blank=True)
    employer_feedback_email = models.EmailField(null=True, blank=True)
    employer_feedback_type = models.CharField(max_length=50, null=True)
    employer_feedback_message = models.TextField(null=True, blank=True)
    employer_feedback_reply = models.CharField(max_length=200, null=True, blank=True)
    employer_feedback_status = models.IntegerField(null=True, blank=True)

class employer_post_vacency(models.Model):
    employer_id = models.ForeignKey(company_registration,on_delete=models.SET_NULL,related_name='employer_action', null=True, blank=True)
    employer_job_title = models.CharField(max_length=70, null=True,blank=True)
    employer_email = models.EmailField(null=True, blank=True)
    employer_contact = models.CharField(max_length=50, null=True,blank=True)
    employer_experience = models.CharField(max_length=50, null=True,blank=True)
    employer_graduation = models.CharField(max_length=100, null=True, blank=True)
    employer_vacency_number = models.CharField(max_length=50, null=True)
    employer_skill = models.CharField(max_length=50,null=True, blank=True)
    employer_description = models.TextField()
    employer_date = models.DateField(auto_now_add=True,null=True, blank=True)
    employer_enddate = models.DateField(auto_now=False,null=True, blank=True)
    employer_jobstatus = models.IntegerField()

class candidates_applied(models.Model):
    candidates_id = models.ForeignKey(user_registration,on_delete=models.SET_NULL,related_name='candidates_view', null=True, blank=True)
    candidates_employer_id = models.ForeignKey(company_registration,on_delete=models.SET_NULL,related_name='candidates_employer', null=True, blank=True)
    candidates_job_id = models.ForeignKey(employer_post_vacency,on_delete=models.SET_NULL,related_name='candidates_job', null=True, blank=True)
    candidates_resume = models.FileField(upload_to='images/', null=True, blank=True)
    candidate_status = models.IntegerField(null=True, blank=True)
    candidates_placed = models.IntegerField(null=True, blank=True)

   
