# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-08-27 19:04
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_auto_20180827_1858'),
    ]

    operations = [
        migrations.RenameField(
            model_name='course',
            old_name='tercher',
            new_name='teacher',
        ),
    ]
