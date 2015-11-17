# python-easy-build - The Easy Executable Builder for Python

A script that automatically generates packaged executables from Python scripts (using PyInstaller).

# Preparation

* Ensure you have Python.

* Install [pip](https://pypi.python.org/pypi/pip).

* Install pyinstaller using pip (for eg. `sudo pip install --global pyinstaller` for *nix systems.

* Install [scons](http://www.scons.org).
  
  * For Debian-based Linux systems: `sudo apt-get install scons`
  * For RPM Linux systems: download [this](http://downloads.sourceforge.net/project/scons/scons/2.4.1/scons-2.4.1-1.noarch.rpm?r=http%3A%2F%2Fwww.scons.org%2F&ts=1447744323&use_mirror=netassist) and install.
  * For Mac OS X: download [this](http://downloads.sourceforge.net/project/scons/scons/2.4.1/scons-2.4.1.tar.gz?r=http%3A%2F%2Fwww.scons.org%2Fdownload.php&ts=1447744509&use_mirror=netassist), then untar, then cd into the extracted directory and `sudo python setup.py install`.
  
* Install [wine](winehq.org).
  
  * For Debian-based Linux systems: `sudo apt-get install wine winetricks wine-cfg`
  * For RPM Linux systems: `sudo yum install wine wine-*`
  * For Mac OS X: Follow [this](http://wiki.winehq.org/MacOSX) guide.

This script depends on all of the above to function properly.

# 32-bit executables on 64-bit

Apparently, Python (and PyInstaller) can only generate binaries of the architecture of Python on your machine.
If you are on a 64-bit machine wanting to build for 32-bit, use a 32-bit OS in a VM or another machine.

Sorry, but this is a limitation of the fact that Python is interpreted.


