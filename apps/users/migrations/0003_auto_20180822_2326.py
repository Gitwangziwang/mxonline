# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-08-22 23:26
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0002_auto_20180814_2048'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userprofile',
            old_name='nick_name',
            new_name='name',
        ),
    ]
