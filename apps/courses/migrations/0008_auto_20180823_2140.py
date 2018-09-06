# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-08-23 21:40
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0007_course_tercher'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='teacher_tell_you',
            field=models.CharField(default='', max_length=100, verbose_name='老师告诉你'),
        ),
        migrations.AddField(
            model_name='course',
            name='you_need_know',
            field=models.CharField(default='', max_length=100, verbose_name='课程须知'),
        ),
    ]