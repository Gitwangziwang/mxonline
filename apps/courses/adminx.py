# _*_ coding:utf8 _*_

__author__ = 'wzw'
__date__ = '18-8-14 下午9:32'

import xadmin

from .models import Course,Lesson,Video,CourseResource,BannerCourse


class LessonInline(object):    #内联，可在Course里面直接添加Lesson信息
    model = Lesson
    extra = 0


class CourseResourceInline(object):    #内联，可在Course里面直接添加CourseResource信息
    model = CourseResource
    extra = 0


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_times', 'student', 'fav_nums', 'image','click_nums', 'add_time','get_zj_nums','go_to']
    search_fields = ['name', 'desc', 'detail', 'degree', 'student', 'fav_nums', 'image','click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times', 'student', 'fav_nums', 'image','click_nums', 'add_time']
    ordering = ['-click_nums']       #默认排序
    readonly_fields = ['fav_nums']  #只读
    list_editable = ['degree','desc']   #列表页可直接编辑修改
    exclude = ['click_nums']     #隐藏
    inlines = [LessonInline,CourseResourceInline]
    style_fields = {"detail":"ueditor"}

    def queryset(self):
        qs = super(CourseAdmin,self).queryset()
        qs = qs.filter(is_banner = False)        #只显示非轮播课程
        return qs
    def save_models(self):
        #在保存课程的时候统计课程机构的课程数
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.course_nums = Course.objects.filter(course_org=course_org)
            course_org.save()

class BannerCourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree','learn_times', 'student', 'fav_nums', 'image','click_nums', 'add_time','get_zj_nums']
    search_fields = ['name', 'desc', 'detail', 'degree', 'student', 'fav_nums', 'image','click_nums']
    list_filter = ['name', 'desc', 'detail', 'degree','learn_times', 'student', 'fav_nums', 'image','click_nums', 'add_time']
    ordering = ['-click_nums']       #默认排序
    readonly_fields = ['fav_nums']  #只读
    exclude = ['click_nums']     #隐藏
    inlines = [LessonInline,CourseResourceInline]

    def queryset(self):
        qs = super(BannerCourseAdmin,self).queryset()
        qs = qs.filter(is_banner = True)
        return qs

class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson__name', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download','add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course__name', 'name', 'download','add_time']


xadmin.site.register(Course,CourseAdmin)
xadmin.site.register(BannerCourse,BannerCourseAdmin)
xadmin.site.register(Lesson,LessonAdmin)
xadmin.site.register(Video,VideoAdmin)
xadmin.site.register(CourseResource,CourseResourceAdmin)