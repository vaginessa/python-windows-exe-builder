#!/usr/bin/env python2

# Copyright (c) 2016 Bharadwaj Raju <bharadwaj.raju777@gmail.com>. All Rights Reserved.

# Apache License 2.0

from sys import exit
import urllib
from os import system
import argparse

arg_parser = argparse.ArgumentParser(
description='Package a Python program for Windows on Mac and Linux.')

arg_parser.add_argument('-v', '--python', metavar='version', type=int,
help='Specify Python version as such: 2 for 2.7, 3 for 3.5 and 34 for 3.4.',
required=True, choices=[2, 3, 34])

arg_parser.add_argument('-p', '--packages', metavar='file',
help='Specify newline-separated list file of PyPi packages to install')

args = arg_parser.parse_args()

if args.python == 2:

    urllib.urlretrieve('https://www.python.org/ftp/python/2.7.10/python-2.7.10.msi', 'pysetup.msi')

    system(r'wine msiexec /qn pysetup.msi')

    system(r'wine setx \M PATH "%PATH%;C:\Python\Python27;C:\Python\Python27\Scripts"')

elif args.python == 3:

    urllib.urlretrieve('https://www.python.org/ftp/python/3.5.1/python-3.5.1.exe', 'pysetup.exe')

    system('wine pysetup.exe /quiet PrependPath=1')

elif args.python == 34:

    urllib.urlretrieve('https://www.python.org/ftp/python/3.4.4/python-3.4.4.msi', 'pysetup.msi')

    system('wine msiexec /qn pysetup.msi')

    system(r'wine setx \M PATH "%PATH%;C:\Python\Python34;C:\Python\Python34\Scripts"')

else:

    print 'Python version not specified. See --help.'

    exit(1)

system('wine pip install pypiwin32')

if args.packages is not None:

    with open(args.packages) as package_file:

        for line in package_file:

            system('wine pip install %s' % line)

print '''
Python, PyWin32 and any other packages specified (if any) have been installed.

NOTE: Some packages (such as PyQt) are not on PyPi and must be separately installed.

Now you can run `wine pyinstaller ...`'''
