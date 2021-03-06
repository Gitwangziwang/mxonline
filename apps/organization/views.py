#coding:utf-8
from django.shortcuts import render
from django.views.generic import View
from .models import CourseOrg,CityDict,Teacher
from operation.models import UserFavorite
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import UserAskForm
from django.http import HttpResponse
from courses.models import Course
from django.db.models import Q
# Create your views here.


class OrgView(View):
    def get(self,request):
        all_org = CourseOrg.objects.all()
        hot_orgs = all_org.order_by("-click_nums")[:3]        # 热门机构排序
        all_city = CityDict.objects.all()

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_org = all_org.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))

        city_id = request.GET.get('city','')                 # 城市筛选
        if city_id:
            all_org = all_org.filter(city_id=int(city_id))

        category = request.GET.get('ct', '')        # 机构类别筛选
        if category:
            all_org = all_org.filter(category=category)

        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                all_org = all_org.order_by("-students")         #按照学习人数排序
            elif sort == "courses_nums":
                all_org = all_org.order_by("-courses_nums")    # 按照课程数排序

        org_nums = all_org.count()

        try:
            page = request.GET.get('page', 1)           # 对课程机构进行分页
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_org, 5, request=request)     #每页５个

        org = p.page(page)

        return render(request,'org-list.html',{
            'all_org':org,
            'all_city':all_city,
            'org_nums':org_nums,
            "city_id": city_id,
            "category ": category,
            "hot_orgs": hot_orgs,
            "sort ": sort,
        })


class AddUserAskView(View):
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            userask_form.save()
            return HttpResponse("{'status':'success'}", content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':'添加出错'}", content_type='application/json')


class OrgHomeView(View):
    def get(self,request,org_id):
        current_page = 'home',
        course_org = CourseOrg.objects.get(id=int(org_id))
        course_org.click_nums +=1
        course_org.save()
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_course = course_org.course_set.all()
        all_teacher = course_org.teacher_set.all()
        return render(request,'org-detail-homepage.html',{
            'course_org':course_org,
            'all_course':all_course,
            'all_teacher':all_teacher,
            'current_page':current_page,
            'has_fav':has_fav,
        })


class OrgCourseView(View):
    def get(self,request,org_id):
        current_page = 'course',
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_course = course_org.course_set.all()
        return render(request,'org-detail-course.html',{
            'course_org':course_org,
            'all_course':all_course,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgDescView(View):
    def get(self,request,org_id):
        current_page = 'desc',
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_course = course_org.course_set.all()
        return render(request,'org-detail-desc.html',{
            'course_org':course_org,
            'all_course':all_course,
            'current_page': current_page,
            'has_fav': has_fav,
        })


class OrgTeacherView(View):
    def get(self,request,org_id):
        current_page = 'teacher',
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_teacher = course_org.teacher_set.all()
        return render(request,'org-detail-teacher.html',{
            'course_org':course_org,
            'all_teacher':all_teacher,
            'current_page':current_page,
            'has_fav': has_fav,
        })


class AddFavView(View):
    def post(self,request):
        fav_id = request.POST.get('fav_id','')
        fav_type = request.POST.get('fav_type','')
        if not request.user.is_authenticated():
            return HttpResponse("{'status':'fail','msg':'用户未登录'}", content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user,fav_id=int(fav_id),fav_type=int(fav_type))
        if exist_records:
            exist_records.delete()
            if int(fav_type) ==1:
                course = Course.objects.get(id=int(fav_id))
                course.fav_nums -=1
                if course.fav_nums<0:
                    course.fav_nums =0
                course.save()
            elif int(fav_type) ==2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums -= 1
                if course_org.fav_nums<0:
                    course_org.fav_nums =0
                course_org.save()
            elif int(fav_type) ==3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_nums -= 1
                if teacher.fav_nums<0:
                    teacher.fav_nums =0
                teacher.save()

            return HttpResponse("{'status':'success','msg':'收藏'}", content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id)>0 and int(fav_type)>0:
               user_fav.user = request.user
               user_fav.fav_id = int(fav_id)
               user_fav.fav_type =int(fav_type)
               user_fav.save()

               if int(fav_type) == 1:
                   course = Course.objects.get(id=int(fav_id))
                   course.fav_nums += 1
                   course.save()
               elif int(fav_type) == 2:
                   course_org = CourseOrg.objects.get(id=int(fav_id))
                   course_org.fav_nums += 1
                   course_org.save()
               elif int(fav_type) == 3:
                   teacher = Teacher.objects.get(id=int(fav_id))
                   teacher.fav_nums += 1
                   teacher.save()
               return HttpResponse("{'status':'success','msg':'已收藏'}", content_type='application/json')
            else:
                return  HttpResponse("{'status':'fail','msg':'收藏出错'}", content_type='application/json')


class TeacherListView(View):
    def get(self,request):
        all_teacher = Teacher.objects.all()

        # 机构搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teacher = all_teacher.filter(Q(name__icontains=search_keywords) |
                                             Q(work_company__icontains=search_keywords)|
                                             Q(work_position__icontains=search_keywords))

        sort = request.GET.get('sort', "")
        if sort:
            if sort == "hot":
                all_teacher = all_teacher.order_by("-click_nums")  # 按照人气排

        sorted_teacher = Teacher.objects.all().order_by("-click_nums")[:3]
        teacher_nums = all_teacher.count()

        try:
            page = request.GET.get('page', 1)  # 对讲师进行分页
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_teacher, 5, request=request)  # 每页５个

        teacher = p.page(page)

        return render(request,'teachers-list.html',{
            'all_teachers':teacher,
            'teacher_nums':teacher_nums,
            'sorted_teacher':sorted_teacher,
            'sort':sort,

        })


class TeacherDetailView(View):
    def get(self,request,teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        teacher.click_nums +=1
        teacher.save()
        all_courses = Course.objects.filter(teacher=teacher)

        has_fav_teacher = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                has_fav_teacher = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.org.id, fav_type=2):
                has_fav_org = True
        sorted_teacher = Teacher.objects.all().order_by("-click_nums")[:3]
        return render(request,'teacher-detail.html',{
            'teacher':teacher,
            'all_courses':all_courses,
            'sorted_teacher':sorted_teacher,
            'has_fav_teacher': has_fav_teacher,
            'has_fav_org':has_fav_org,
        })

