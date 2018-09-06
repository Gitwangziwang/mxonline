# _*_ coding:utf8 _*_

__author__ = 'wzw'
__date__ = '18-8-27 下午8:59'

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


class LoginRequireMixin(object):

    @method_decorator(login_required(login_url='/login/'))
    def dispatch(self,request,*args,**kwargs):
        return super(LoginRequireMixin,self).dispatch(request,*args,**kwargs)