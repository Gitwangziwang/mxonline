#coding:utf-8
from django.db import models
from datetime import datetime
from organization.models import CourseOrg,Teacher
from DjangoUeditor.models import UEditorField
# Create your models here.


class Course(models.Model):
    course_org = models.ForeignKey(CourseOrg,verbose_name=u"所属课程机构",null=True)
    teacher = models.ForeignKey(Teacher,verbose_name=u"讲师",null=True,blank=True)
    name = models.CharField(max_length=50,verbose_name=u"课程名")
    desc = models.CharField(max_length=300,verbose_name=u"课程描述")
    category = models.CharField(max_length=20,verbose_name=u"课程类别",default=u"后端开发")
    detail = UEditorField(verbose_name=u'课程详情',width=600, height=300, imagePath="course/ueditor/",
                          filePath="course/ueditor/",default='')
    is_banner = models.BooleanField(default=False,verbose_name=u"是否轮播")
    degree = models.CharField(max_length=5,choices=(("cj","初级"),("zj","中级"),("gj","高级")),verbose_name=u"课程难度")
    learn_times = models.IntegerField(default=0,verbose_name=u"学习时长（分钟数）")
    student = models.IntegerField(default=0,verbose_name=u"学习人数")
    tag = models.CharField(default="",max_length=20,verbose_name=u"课程标签")
    fav_nums = models.IntegerField(default=0,verbose_name=u"收藏人数")
    image = models.ImageField(max_length=100,upload_to="courses/%Y%m%d",verbose_name=u"封面")
    click_nums = models.IntegerField(default=0,verbose_name=u"点击数")
    add_time = models.DateTimeField(default=datetime.now,verbose_name=u"添加时间")
    you_need_know = models.CharField(default="",max_length=100,verbose_name=u"课程须知")
    teacher_tell_you = models.CharField(default="", max_length=100, verbose_name=u"老师告诉你")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_zj_nums(self):
        return self.lesson_set.all().count()            #获取课程章节数
    get_zj_nums.short_description = "章节数"        #显示名称

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='https://www.imooc.com/'>跳转</a>")     #跳转到一个网页
    go_to.short_description = "跳转"

    def get_course_lesson(self):
        return self.lesson_set.all()          #获取课程章节信息

    def get_learn_user(self):
        return self.usercourse_set.all()[:5]

    def __str__(self):
        return self.name


class BannerCourse(Course):          #继承Course
    class Meta:
        verbose_name = u"轮播课程　"
        verbose_name_plural = verbose_name
        proxy = True         #配置这个，就不会生成新的表,一定要记得加这个

class Lesson(models.Model):
    course = models.ForeignKey(Course,verbose_name=u"课程")
    name = models.CharField(max_length=100,verbose_name=u"章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"章节"
        verbose_name_plural = verbose_name

    def get_lesson_video(self):
        return self.video_set.all()

    def __str__(self):
        return self.name


class Video(models.Model):
    lesson = models.ForeignKey(Lesson,verbose_name=u"章节")
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长（分钟数）")
    url = models.CharField(max_length=300,default="",verbose_name=u"访问地址")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"视频"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CourseResource(models.Model):
    course = models.ForeignKey(Course,verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"资源名")
    download = models.FileField(max_length=100,upload_to="course/resoure/%Y%m%d",verbose_name=u"下载资源")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
