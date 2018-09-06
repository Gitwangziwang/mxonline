# coding:utf-8
from django.db import models
from datetime import datetime

from django.contrib.auth.models import AbstractUser

# Create your models here.


class UserProfile(AbstractUser):
    name = models.CharField(max_length=20,verbose_name=u"昵称")
    birthday = models.DateField(null=True,verbose_name=u"生日")
    gender = models.CharField(max_length=5,choices=(('male',u"男"),('female',u"女")),default='male',verbose_name=u"性别")
    address = models.CharField(max_length=50,verbose_name=u"联系地址")
    mobile = models.CharField(max_length=11,verbose_name=u"手机号码")
    image = models.ImageField(max_length=100,upload_to = 'image/%Y%m%d',verbose_name=u"头像")

    class Meta:
        verbose_name=u"用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def unread_nums(self):
        #获取用户未读消息的数量
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id,has_read=False).count()


class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name=u"验证码")
    email = models.EmailField(max_length=50, verbose_name=u"邮箱")
    send_type = models.CharField(max_length=50, choices=(("register", u"注册"), ("forget", u"忘记密码"),("update_email",u"修改邮箱")),
                                 verbose_name=U"验证码类型")
    send_time = models.DateTimeField(default=datetime.now, verbose_name=u"发送时间")

    class Meta:
        verbose_name = u"邮箱验证码"
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}{1}'.format(self.code, self.email)


class Banner(models.Model):
    title = models.CharField(max_length=50, verbose_name=u"标题")
    image = models.ImageField(max_length=100, upload_to="banner/%Y/%m%d", verbose_name=u"轮播图")
    url = models.URLField(max_length=200, verbose_name=u"访问地址")
    index = models.IntegerField(default=0, verbose_name=u"顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"轮播图"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title


