# The Windows Executable Builder for Python

A script that automatically generates packaged Windows executables from Python scripts (using PyInstaller) on OS X and Linux.

Released under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

# Preparation

* Install [wine](http://winehq.org).

    * For Mac OS X: install `XCode`, install its `Command Line Tools`, then follow [this](http://wiki.winehq.org/MacOSX) guide.

# Usage

First run `environment_setup.py`,
```
Usage: environment_setup.py [-h] -v version [-p file]

Package a Python program for Windows on Mac and Linux.

optional arguments:
  -h, --help            show this help message and exit
  -v version, --python version
                        Specify Python version as such: 2 for 2.7, 3 for 3.5
                        and 34 for 3.4.
  -p file, --packages file
                        [optional] Specify newline-separated list file of PyPi packages
                        to install

```

Then, simply run `wine pyinstaller [options for pyinstaller]`.

# Move (Wine) development environment

Just copy the `~/.wine` folder to the new machine.

# A note on architecture

This script produces 32-bit executables no matter the architecture of the host.
