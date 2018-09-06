# _*_ coding:utf8 _*_

__author__ = 'wzw'
__date__ = '18-8-14 下午9:41'

import xadmin

from .models import CityDict,CourseOrg,Teacher


class CityDictAdmin(object):
    list_display = ['name','desc', 'add_time']
    search_fields = ['name','desc']
    list_filter = ['name','desc', 'add_time']


class CourseOrgAdmin(object):
    list_display = ['city','name','desc', 'fav_nums','image','click_nums','address','add_time']
    search_fields = ['city','name','desc', 'fav_nums','image','click_nums','address']
    list_filter = ['city','name','desc', 'fav_nums','image','click_nums','address','add_time']
    relfields_style = 'fk-ajax'   #搜索，非下拉

class TeacherAdmin(object):
    list_display = ['org','name','work_year', 'work_company','work_position','points','fav_nums','click_nums','add_time']
    search_fields = ['org','name','work_year', 'work_company','work_position','points','fav_nums','click_nums']
    list_filter = ['org','name','work_year', 'work_company','work_position','points','fav_nums','click_nums','add_time']


xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdmin)