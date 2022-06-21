from datetime import datetime
from django.shortcuts import redirect, render
from app.models import *
from django.db.models import Q
from django.contrib.auth import authenticate, login, logout
from jobs4you.settings import EMAIL_HOST_USER
from django.core.mail import send_mail

def login(request):
    if request.method == 'POST':
        email  = request.POST['email']
        password = request.POST.get('password')
        user = authenticate(username=email, password=password)
        if user is not None:
            request.session['SAdm_id'] = user.id
            return redirect('admin_dashboard')
        elif user_registration.objects.filter(user_email = email,user_password = password).exists():
            log = user_registration.objects.get(user_email = request.POST['email'],user_password = request.POST['password'])
            request.session['user_id'] = log.id
            request.session['user_edn'] = log.user_education
            if request.session.has_key('user_id'):
                user_id = request.session['user_id']
            else:
                return redirect('/')
            mem = user_registration.objects.filter(id=user_id)
            return redirect('user_dash')
        elif company_registration.objects.filter(company_email = email,company_password = password).exists():
            log = company_registration.objects.get(company_email =  request.POST['email'],company_password = request.POST['password'])
            request.session['emp_id'] = log.id
            if request.session.has_key('emp_id'):
                emp_id = request.session['emp_id']
            else:
                return redirect('/')
            mem = company_registration.objects.filter(id=emp_id)
            if company_registration.objects.filter(id=emp_id,company_status=1):
                return redirect('company_dash')
            else:
                msg_success = "you are not verified by Admin . kindly wait to get verified"
                return render(request, 'login.html',{'msg_success':msg_success})
        else:
            context = {'msg_error': 'Invalid data'}
            return render(request, 'login.html', context)
    return render(request,'login.html')

def user_register(request):
    if request.method == 'POST':
        reg = user_registration()
        reg.user_fullname = request.POST['name']
        reg.user_age = request.POST['age']
        reg.user_education = request.POST['education']
        reg.user_experience = request.POST['experience']
        reg.user_email = request.POST['email']
        reg.user_contact = request.POST['number']
        reg.user_gender = request.POST.get('gender')
        reg.user_city = request.POST['city']
        reg.user_photo = request.FILES['photo']
        reg.user_resume = request.FILES['resume']
        reg.user_password = request.POST['password']
        reg.save()
        # subject = 'Greetings from iNFOX TECHNOLOGIES'
        # message = 'Congratulations,\n' \
        #     'You are successfully registered with iNFOX TECHNOLOGIES.\n' \
        #     'We are so happy to have you here\n'\
        #     'You can login with your registered email and password \n'\
        #     'NOTE : THIS IS A SYSTEM GENETATED MAIL PLEASE DO NOT REPLY' 
        # recepient = str(reg.user_email)
        # send_mail(subject, message, EMAIL_HOST_USER,
        #           [recepient], fail_silently=False)
        msg_success = "Registration Successfull"
        return render(request,'user_register.html',{'msg_success':msg_success})
    return render(request,'user_register.html')

def company_register(request):
    if request.method == 'POST':
        reg = company_registration()
        reg.company_name = request.POST['cname']
        reg.company_address = request.POST['caddress']
        reg.company_description = request.POST['cdiscription']
        reg.company_city = request.POST['city']
        reg.company_website = request.POST['curl']
        reg.company_email = request.POST['email']
        reg.company_contact = request.POST['number']
        reg.company_logo = request.FILES['cimage']
        reg.company_password = request.POST.get('password')
        reg.company_status = 0
        reg.save()
        # subject = 'Greetings from iNFOX TECHNOLOGIES'
        # message = 'Congratulations,\n' \
        #     'You are successfully registered with iNFOX TECHNOLOGIES.\n' \
        #     'We are so happy to have you here\n'\
        #     'You can access your you account once admin verify it.\n'\
        #     'Kindly wait for you to get veified  \n'\
        #     'NOTE : THIS IS A SYSTEM GENETATED MAIL PLEASE DO NOT REPLY' 
        # recepient = str(reg.company_email)
        # send_mail(subject, message, EMAIL_HOST_USER,
        #           [recepient], fail_silently=False)
        msg_success = "Registration Successfull.You will receive notification from admin after verification"
        return render(request,'company_register.html',{'msg_success':msg_success})
    return render(request,'company_register.html')

def user_index(request):
    return render(request,'user_index.html')

def user_dash(request):
    if request.session.has_key('user_id'):
        user_id = request.session['user_id']
    else:
        return redirect('/')
    mem = user_registration.objects.filter(id=user_id)
    var = company_registration.objects.all()
    feedback = user_feedback.objects.all()
    employer = company_registration.objects.all().count()
    resume = user_registration.objects.all().count()
    reg = user_feedback()
    if request.method == 'POST':
        reg.user_feedback_name = request.POST['name']
        reg.user_feedback_email = request.POST['email']
        reg.user_feedback_profession = request.POST['profession']
        reg.user_feedback_message = request.POST['comments']
        reg.user_feedback = user_registration.objects.get(id=user_id)
        reg.user_feedback_status = 0
        reg.save()
        msg_success = "feedback added"
        return render(request,'user_dash.html',{'mem':mem,'msg_success':msg_success,'var':var,'feedback':feedback,'employer':employer,'resume':resume})
    return render(request,'user_dash.html',{'var':var,'mem':mem,'feedback':feedback,'employer':employer,'resume':resume})

def user_view_companies(request):
    if request.session.has_key('user_id'):
        user_id = request.session['user_id']
    else:
        return redirect('/')
    mem = user_registration.objects.filter(id=user_id)
    var = company_registration.objects.all()
    return render(request,'user_view_companies.html',{'mem':mem,'var':var})

def user_view_company(request):
    return render(request,'user_view_company.html')

def user_logout(request):
    if 'user_id' in request.session:  
        request.session.flush()
        return redirect('/')
    else:
        return redirect('/') 

def jobs_list(request):
    if request.session.has_key('user_id'):
        user_id = request.session['user_id']
    if request.session.has_key('user_edn'):
        user_edn = request.session['user_edn']
    else:
        return redirect('/')
    mem = user_registration.objects.filter(id=user_id)
    vacency_list = employer_post_vacency.objects.all()
    return render(request,'jobs_list.html',{'mem':mem,'vacency_list':vacency_list})

def apply(request,id):
    if request.session.has_key('user_id'):
        user_id = request.session['user_id']
    else:
        return redirect('/')
    mem = user_registration.objects.filter(id=user_id)
    vacency_list = employer_post_vacency.objects.get(id = id)
    if request.method == 'POST':
        reg = candidates_applied()
        reg.candidates_id = user_registration.objects.get(id = user_id)
        
        reg.candidates_job_id = employer_post_vacency.objects.get(id = id)
        reg.candidates_resume = request.FILES['certificate']
        reg.candidate_status = 0
        reg.save()
        msg_success = " Successfully Applied"
        return render(request,'apply.html',{'mem':mem,'vacency_list':vacency_list,'msg_success':msg_success})
    return render(request,'apply.html',{'mem':mem,'vacency_list':vacency_list})

def user_reply(request):
    if request.session.has_key('user_id'):
        user_id = request.session['user_id']
    else:
        return redirect('/')
    mem = user_registration.objects.filter(id=user_id)
    reply = user_feedback.objects.filter(user_feedback_status = 1,user_feedback = user_id)
    return render(request,'user_reply.html',{'mem':mem,'reply':reply})
#-----------------------------------------Employer-------------------------------------------------

def post_vacency(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    reg = employer_post_vacency()
    if request.method == 'POST':
        reg.employer_id = company_registration.objects.get(id=emp_id)
        reg.employer_job_title = request.POST['title']
        reg.employer_email = request.POST['email']
        reg.employer_contact = request.POST['contact']
        reg.employer_experience = request.POST['experience']
        reg.employer_graduation = request.POST['graduation']
        reg.employer_skill = request.POST['skill1']
        reg.employer_description = request.POST['description']
        reg.employer_vacency_number = request.POST['vacency']
        reg.employer_date = datetime.now().date()
        reg.employer_enddate = request.POST['enddate']
        reg.employer_jobstatus = 0
        reg.save()
        msg_success = "job posted"
        return render(request,'post_vacency.html',{'mem':mem,'msg_success':msg_success})
    return render(request,'post_vacency.html',{'mem':mem})

def company_index(request):
    return render(request,'company_index.html')

def company_dash(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    feedback = employer_feedback.objects.all()
    resume = user_registration.objects.all().count()
    employer = company_registration.objects.all().count()
    
    reg = employer_feedback()
    if request.method == 'POST':
        reg.employer_feedback_name = request.POST['name']
        reg.employer_feedback_email = request.POST['email']
        reg.employer_feedback_type = request.POST['type']
        reg.employer_feedback_message = request.POST['comments']
        reg.employer_feedback_status = 0
        reg.employer_feedback_id = company_registration.objects.get(id=emp_id)
        reg.save()
        msg_success = "feedback added"
        return render(request,'company_dash.html',{'mem':mem,'msg_success':msg_success,'employer':employer,'resume':resume,'feedback':feedback})
    return render(request,'company_dash.html',{'mem':mem,'employer':employer,'resume':resume,'feedback':feedback})
    
def vacency_update(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    vacency_list = employer_post_vacency.objects.filter(Q(employer_id = emp_id)|Q(employer_jobstatus = 0))
    return render(request,'vacency_update.html',{'mem':mem,'vacency_list':vacency_list})

def jobdelete(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    tid = request.GET.get('tid')
    var = employer_post_vacency.objects.filter(id=tid)
    var.delete()
    msg_success = "Vacency deleted"
    return render(request,'vacency_update.html',{'msg_success':msg_success})

def vacencyupdate(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    if request.method == 'POST':
        tid = request.GET.get('tid')
        abc = employer_post_vacency.objects.get(id=tid)
        abc.employer_experience = request.POST.get('experience')
        abc.employer_graduation = request.POST.get('qualification')
        abc.employer_vacency_number = request.POST.get('vacency')
        abc.employer_enddate = request.POST.get('enddate')
        abc.save()
        msg_success = "Vacency updated"
        return render(request,'vacency_update.html',{'msg_success':msg_success})
    else:
        pass

def employer_reply(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    reply = employer_feedback.objects.filter(employer_feedback_status = 1,employer_feedback_id = emp_id)
    return render(request,'employer_reply.html',{'mem':mem,'reply':reply})

def applied_candidates(request):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    vacency_list = employer_post_vacency.objects.filter(employer_id = emp_id)
    return render(request,'applied_candidates.html',{'mem':mem,'vacency_list':vacency_list})

def candidates_view(request,id):
    if request.session.has_key('emp_id'):
        emp_id = request.session['emp_id']
    else:
        return redirect('/')
    mem = company_registration.objects.filter(id=emp_id)
    candidates_list = candidates_applied.objects.filter(candidates_job_id = id)
    return render(request,'candidates_view.html',{'mem':mem,'candidates_list':candidates_list})

def emp_logout(request):
    if 'emp_id' in request.session:  
        request.session.flush()
        return redirect('/')
    else:
        return redirect('/') 
#--------------------------------------------Admin----------------------------------------------------------------

def admin_dashboard(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        resume = user_registration.objects.all().count()
        employer = company_registration.objects.all().count()
        feedback = user_feedback.objects.all()
        return render(request,'admin/admin_dashboard.html',{'users':users,'resume':resume,'employer':employer,'feedback':feedback})
    else:
        return redirect('/')

def admin_verifycompany(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employer = company_registration.objects.filter(company_status = 0)
        return render(request,'admin/admin_verifycompany.html',{'users':users,'employer':employer})
    else:
        return redirect('/')

def verify(request):
    if request.session.has_key('SAdm_id'):
        SAdm_id = request.session['SAdm_id']
    users = User.objects.filter(id=SAdm_id)
    if request.method == 'POST':
        tid = request.GET.get('tid')
        reg = company_registration.objects.get(id=tid)
        reg.company_status = 1
        reg.save()
        em=company_registration.objects.get(id=tid)
        subject = 'Greetings from iNFOX TECHNOLOGIES'
        message = 'Congratulations,\n' \
            'You are successfully verified by iNFOX TECHNOLOGIES.\n' \
            'We are so happy to have you here\n'\
            'You can login with your registered email and password \n'\
            'NOTE : THIS IS A SYSTEM GENETATED MAIL PLEASE DO NOT REPLY' 
        recepient = str(em.company_email)
        send_mail(subject, message, EMAIL_HOST_USER,
                  [recepient], fail_silently=False)
        msg_success = "verified successfully"
        return render(request,'admin/admin_verifycompany.html',{'users':users,'msg_success':msg_success})
    return render(request,'admin/admin_verifycompany.html',{'users':users})

def admin_viewuser(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = user_registration.objects.all()
        return render(request,'admin/admin_viewuser.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def admin_view_companies(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = company_registration.objects.filter(company_status = 1)
        return render(request,'admin/admin_view_companies.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def admin_companyfeedback(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = employer_feedback.objects.filter(employer_feedback_status = 0)
        return render(request,'admin/admin_companyfeedback.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def reply(request):
    if request.session.has_key('SAdm_id'):
        SAdm_id = request.session['SAdm_id']
    users = User.objects.filter(id=SAdm_id)
    if request.method == 'POST':
        tid = request.GET.get('tid')
        reg = employer_feedback.objects.get(id=tid)
        reg.employer_feedback_reply = request.POST['teams']
        reg.employer_feedback_status = 1
        reg.save()
        msg_success = 'Replied'
        return render(request,'admin/admin_companyfeedback.html',{'users':users,'msg_success':msg_success})
    return render(request,'admin/admin_companyfeedback.html',{'users':users})

def admin_userfeedback(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = user_feedback.objects.filter(user_feedback_status = 0)
        return render(request,'admin/admin_userfeedback.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def reply_user(request):
    if request.session.has_key('SAdm_id'):
        SAdm_id = request.session['SAdm_id']
    users = User.objects.filter(id=SAdm_id)
    if request.method == 'POST':
        tid = request.GET.get('tid')
        reg = user_feedback.objects.get(id=tid)
        reg.user_feedback_reply = request.POST['teams']
        reg.user_feedback_status = 1
        reg.save()
        msg_success = 'Replied'
        return render(request,'admin/admin_userfeedback.html',{'users':users,'msg_success':msg_success})
    return render(request,'admin/admin_userfeedback.html',{'users':users})

def employers_feedback(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = employer_feedback.objects.filter(employer_feedback_status = 1)
        return render(request,'admin/employer_feedback.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def jobseeker_feedback(request):
    if 'SAdm_id' in request.session:
        if request.session.has_key('SAdm_id'):
            SAdm_id = request.session['SAdm_id']
        users = User.objects.filter(id=SAdm_id)
        employee = user_feedback.objects.filter(user_feedback_status = 1)
        return render(request,'admin/jobseeker_feedback.html',{'users':users,'employee':employee})
    else:
        return redirect('/')

def admin_logout(request):
    request.session.flush()
    return redirect("/")