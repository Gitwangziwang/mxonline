# _*_ coding:utf8 _*_

__author__ = 'wzw'
__date__ = '18-8-17 上午12:07'

from random import Random
from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from MxOnline.settings import EMAIL_FROM


def random_str(randomlength):     #定义生成随机字符串函数
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars)-1
    random = Random()     #调用django内部生成随机字符串的函数
    for i in range(randomlength):
        str+=chars[random.randint(0,length)]
    return str


def send_email(email,send_type):
    email_record = EmailVerifyRecord()
    if send_type == 'update_email':
        code = random_str(4)
    else:
        code = random_str(16)         #生成１６位的随机字符串形式的验证码
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    if send_type == "register":
        email_title = "慕学在线网注册激活链接"
        email_body = "请点击下面的链接激活你的账号:http://127.0.0.1:8000/active/{0}".format(code) #生成包含验证码的链接
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    elif send_type == "forget":
        email_title = "慕学在线网重置密码链接"
        email_body = "请点击下面的链接重置你的密码:http://127.0.0.1:8000/reset/{0}".format(code)
        send_status = send_mail(email_title,email_body, EMAIL_FROM,[email])
        if send_status:
            pass
    elif send_type == "update_email":
        email_title = "慕学在线网邮箱修改验证码"
        email_body = "你的邮箱验证码为:{0}".format(code)
        send_status = send_mail(email_title,email_body, EMAIL_FROM,[email])
        if send_status:
            pass