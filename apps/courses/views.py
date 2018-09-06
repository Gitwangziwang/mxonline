from django.shortcuts import render
from django.views.generic import View
from .models import Course,CourseResource,Video
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserFavorite,CourseComment,UserCourse
from django.http import HttpResponse
from utils.mixin_utils import LoginRequireMixin
from django.db.models import Q
# Create your views here.


class CourseListView(View):
    def get(self,request):
        all_course = Course.objects.all().order_by("-add_time")
        hot_courses = all_course.order_by("-click_nums")[:3]

        #课程搜索
        search_keywords = request.GET.get('keywords','')
        if search_keywords:
            all_course = all_course.filter(Q(name__icontains=search_keywords)|Q(detail__icontains=search_keywords))

        #课程排序
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "student":
                all_course = all_course.order_by("-student")  # 按照学习人数排序
            elif sort == "click_nums":
                all_course = all_course.order_by("-click_nums")  # 按照点击数排序

        try:
            page = request.GET.get('page', 1)           # 对课程进行分页
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_course, 5, request=request)     #每页5个

        course = p.page(page)
        return render(request,'course-list.html',{
            'all_course':course,
            'sort':sort,
            'hot_courses':hot_courses
        })


class CourseDetailView(View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums +=1
        course.save()
        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user,fav_id=course.id,fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_fav_org = True

        tag = course.tag
        if tag:
            relate_courses = Course.objects.filter(tag=tag)[:1]
        else:
            relate_courses =[]
        return render(request,'course-detail.html',{
            'course':course,
            'relate_courses':relate_courses,
            'has_fav_course':has_fav_course,
            'has_fav_org':has_fav_org,
        })


class CourseInfoView(LoginRequireMixin,View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        course.student +=1
        course.click_nums +=1
        course.save()
        #查询用户是否关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user,course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        user_courses = UserCourse.objects.filter(course =course)
        #得到学过该课程的用户id
        user_ids =[user_course.user.id for user_course in user_courses]
        # 得到所有的课程　
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出该用户学过所有课程的id
        course_ids=[user_course.course.id for user_course in all_user_courses]
        #获取该用户学过其它的所有课程　
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        course_resource = CourseResource.objects.filter(course=course)
        return render(request,'course-info.html',{
            'course': course,
            'course_resource':course_resource,
            'relate_courses': relate_courses,
        })


class CommentsView(LoginRequireMixin,View):
    def get(self,request,course_id):
        course = Course.objects.get(id=int(course_id))
        # 查询用户是否关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()

        user_courses = UserCourse.objects.filter(course=course)
        # 得到学过该课程的用户id
        user_ids = [user_course.user.id for user_course in user_courses]
        # 得到所有的课程　
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        # 取出该用户学过所有课程的id
        course_ids = [user_course.course.id for user_course in all_user_courses]
        # 获取该用户学过其它的所有课程　
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        course_resource = CourseResource.objects.filter(course=course)
        all_comments = CourseComment.objects.all()
        return render(request, 'course-comment.html', {
            'course': course,
            'course_resource': course_resource,
            'all_comments':all_comments,
            'relate_courses': relate_courses,
        })


class AddCommentView(View):
    def post(self,request):
        if not request.user.is_authenticated():     #判断用户登录状态
            return HttpResponse("{'status':'fail','msg':'用户未登录'}", content_type='application/json')

        course_id = request.POST.get('course_id',0)
        comments = request.POST.get('comments', 0)
        if int(course_id) >0 and comments:         #记得加int
            course_comment = CourseComment()
            course = Course.objects.get(id=int(course_id))
            course_comment.course = course
            course_comment.comments= comments
            course_comment.user = request.user
            course_comment.save()
            return HttpResponse("{'status':'success','msg':'添加成功'}",  content_type='application/json')
        else:
            return HttpResponse("{'status':'fail','msg':'添加失败'}", content_type='application/json')


class VideoPlayView(View):
    def get(self,request,video_id):
        video= Video.objects.get(id=int(video_id))
        course=video.lesson.course
        #查询用户是否关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user,course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user,course=course)
            user_course.save()

        user_courses = UserCourse.objects.filter(course =course)
        #得到学过该课程的用户id
        user_ids =[user_course.user.id for user_course in user_courses]
        # 得到所有的课程　
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        #取出该用户学过所有课程的id
        course_ids=[user_course.course.id for user_course in all_user_courses]
        #获取该用户学过其它的所有课程　
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]
        course_resource = CourseResource.objects.filter(course=course)
        return render(request,'course-play.html',{
            'course': course,
            'course_resource':course_resource,
            'relate_courses': relate_courses,
            'video':video,
        })