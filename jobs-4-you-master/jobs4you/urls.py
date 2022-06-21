
from django.contrib import admin
from django.urls import path,re_path
from app import views
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^$',views.login,name='login'),
    re_path(r'^login/$',views.login,name='login'),
    re_path(r'^user_register/$',views.user_register,name='user_register'),
    re_path(r'^company_register/$',views.company_register,name='company_register'),
    re_path(r'^user_index/$',views.user_index,name='user_index'),
    re_path(r'^user_dash/$',views.user_dash,name='user_dash'),
    re_path(r'^user_view_companies/$',views.user_view_companies,name='user_view_companies'),
    re_path(r'^user_view_company/$',views.user_view_company,name='user_view_company'),
    re_path(r'^user_reply/$',views.user_reply,name='user_reply'),
    re_path(r'^company_dash/$',views.company_dash,name='company_dash'),
    re_path(r'^company_index/$',views.company_index,name='company_index'),
    re_path(r'^jobs_list/$',views.jobs_list,name='jobs_list'),
    re_path(r'^post_vacency/$',views.post_vacency,name='post_vacency'),
    re_path(r'^vacency_update/$',views.vacency_update,name='vacency_update'),
    re_path(r'^jobdelete/$',views.jobdelete,name='jobdelete'),
    re_path(r'^vacencyupdate/$',views.vacencyupdate,name='vacencyupdate'),
    re_path(r'^applied_candidates/$',views.applied_candidates,name='applied_candidates'),
    re_path(r'^candidates_view/(?P<id>\d+)/$',views.candidates_view,name='candidates_view'),
    re_path(r'^apply/(?P<id>\d+)/$',views.apply,name='apply'),
    re_path(r'^employer_reply/$',views.employer_reply,name='employer_reply'),
    re_path(r'^user_logout/$',views.user_logout,name='user_logout'),
    re_path(r'^emp_logout/$',views.emp_logout,name='emp_logout'),
    
    #------------------------------------------Admin------------------------------------------------

    re_path(r'^admin_dashboard/$',views.admin_dashboard,name='admin_dashboard'),
    re_path(r'^admin_verifycompany/$',views.admin_verifycompany,name='admin_verifycompany'),
    re_path(r'^verify/$',views.verify,name='verify'),
    re_path(r'^admin_viewuser/$',views.admin_viewuser,name='admin_viewuser'),
    re_path(r'^admin_view_companies/$',views.admin_view_companies,name='admin_view_companies'),
    re_path(r'^admin_companyfeedback/$',views.admin_companyfeedback,name='admin_companyfeedback'),
    re_path(r'^reply/$',views.reply,name='reply'),
    re_path(r'^admin_userfeedback/$',views.admin_userfeedback,name='admin_userfeedback'),
    re_path(r'^reply_user/$',views.reply_user,name='reply_user'),
    re_path(r'^employers_feedback/$',views.employers_feedback,name='employers_feedback'),
    re_path(r'^jobseeker_feedback/$',views.jobseeker_feedback,name='jobseeker_feedback'),
    re_path(r'^admin_logout/$',views.admin_logout,name='admin_logout'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL,
#                           document_root=settings.MEDIA_ROOT)