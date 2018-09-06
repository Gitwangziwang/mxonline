#  coding:utf8
from django.db import models
from datetime import datetime
# Create your models here.


class CityDict(models.Model):
    name = models.CharField(max_length=50, verbose_name=u"城市")
    desc = models.CharField(max_length=300, verbose_name=u"城市描述")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"城市"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseOrg(models.Model):
    city = models.ForeignKey(CityDict, verbose_name=u"所在城市")
    name = models.CharField(max_length=50, verbose_name=u"机构名称")
    desc = models.CharField(max_length=300, verbose_name=u"机构描述")
    category = models.CharField(max_length=20,default="pxjg", choices=(("pxjg", "培训机构"),("gx", "高校"),("gr","个人")), verbose_name=u"机构类别")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    image = models.ImageField(max_length=100, upload_to="courses/%Y%m%d", verbose_name=u"封面")
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    address = models.CharField(max_length=200,verbose_name=u"机构地址")
    students = models.IntegerField(default=0, verbose_name=u"学习人数")
    courses_nums = models.IntegerField(default=0, verbose_name=u"课程数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程机构"
        verbose_name_plural = verbose_name

    def get_teacher_nums(self):
        return self.teacher_set.all().count()


    def __str__(self):
        return self.name


class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name=u"所属机构")
    name = models.CharField(max_length=50, verbose_name=u"教师姓名")
    work_year = models.IntegerField(default=0, verbose_name=u"工作年限")
    work_company = models.CharField(max_length=200, verbose_name=u"就职公司")
    work_position = models.CharField(max_length=200, verbose_name=u"公司职位")
    points = models.CharField(max_length=200, verbose_name=u"教学特点")
    age = models.IntegerField(default=18, verbose_name=u"年龄")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    image = models.ImageField(max_length=100, upload_to="teacher/%Y%m%d", verbose_name=u"头像")
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"教师"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def get_course_nums(self):
        return self.course_set.all().count()