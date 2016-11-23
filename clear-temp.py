#!/usr/bin/python
"""
This script searches in a folder for files older than a week and deletes them.
"""
import time
from datetime import datetime, timedelta
import shutil
import os
from os.path import expanduser

""" Path to clean (without slash at the end) """
folder = expanduser("~") + "/Downloads/temp"

""" Timespan which is tolerable """
oldestdate = datetime.now() - timedelta(days=2)

for element in os.listdir(folder):
    fullpath = folder + "/" + element
    lastmodified = datetime.fromtimestamp(os.path.getmtime(fullpath))

    if lastmodified < oldestdate:
        if os.path.isfile(fullpath):
            os.remove(fullpath)
        else:
            shutil.rmtree(fullpath)

        print ("Deleting element " + element + ": " + str(lastmodified))


