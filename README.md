# The Executable Builder for Python

A script that automatically generates packaged executables from Python scripts (using PyInstaller).

![Python](http://icons.iconarchive.com/icons/cornmanthe3rd/plex/256/Other-python-icon.png) ![To](http://icons.iconarchive.com/icons/icons8/ios7/256/Arrows-Right-icon.png) <img  src="https://www.iconfinder.com/icons/196757/download/png/128" width="200" height="200">


# Preparation

* Ensure you have Python.

* Mac OS X: Install [wine](winehq.org).

  * For Mac OS X: install `XCode`, install its `Command Line Tools`, then follow [this](http://wiki.winehq.org/MacOSX) guide.

This script depends on all of the above to function properly.

# Documentation

Can be found in the code.

# 32-bit executables on 64-bit

Apparently, Python (and PyInstaller) can only generate binaries of the architecture of Python on your machine.
If you are on a 64-bit machine wanting to build for 32-bit, use a 32-bit OS in a VM or another machine.

Sorry, but this is a limitation of the fact that Python is interpreted.
