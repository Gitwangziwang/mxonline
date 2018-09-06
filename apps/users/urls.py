# _*_ coding:utf8 _*_

__author__ = 'wzw'
__date__ = '18-8-29 下午10:05'

from django.conf.urls import url
from .views import UserInfoView,UploadImageView,UpdatePwdView,SendEmailCodeView,UpdateEmailView
from .views import MyCourseView,MyfavOrgView,MyfavTeacherView,MyfavCourserView,MyMessageView

urlpatterns = [
    #用户信息
    url(r'^info/$',UserInfoView.as_view(), name="user_info"),
    #用户头像上传
    url(r'^upload/image/$',UploadImageView.as_view(), name="upload_image"),
    #用户个人中心修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name="update_pwd"),
    #发送邮箱验证码　
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name="sendemail_code"),
    #修改邮箱　
    url(r'^update_email/$', UpdateEmailView.as_view(), name="update_email"),
    #我的课程
    url(r'^mycourse/$', MyCourseView.as_view(), name="mycourse"),
    #我的收藏
    url(r'^myfav/org/$', MyfavOrgView.as_view(), name="myfav_org"),
    url(r'^myfav/teacher/$', MyfavTeacherView.as_view(), name="myfav_teacher"),
    url(r'^myfav/course/$', MyfavCourserView.as_view(), name="myfav_course"),
    #我的消息
    url(r'^mymessage/$', MyMessageView.as_view(), name="mymessage"),
]