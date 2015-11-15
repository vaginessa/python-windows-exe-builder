# python-easy-build - The Easy Executable Builder for Python

A script that automatically generates packaged executables from Python scripts (using PyInstaller).

# 32-bit executables on 64-bit

Apparently, Python (and PyInstaller) can only generate binaries of the architecture of Python on your machine.
If you are on a 64-bit machine wanting to build for 32-bit, use a 32-bit OS in a VM or another machine.

Sorry, but this is a limitation of the fact that Python is interpreted.


