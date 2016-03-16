# The Windows Executable Builder for Python

A script that automatically generates packaged Windows executables from Python scripts (using PyInstaller) on OS X and Linux.

Released under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

# Preparation

* Install [wine](http://winehq.org).

    * For Mac OS X: install `XCode`, install its `Command Line Tools`, then follow [this](http://wiki.winehq.org/MacOSX) guide.

# Usage

First run `environment_setup.sh`,
```
environment_setup.sh [options]

Options:

-p | --python <version> : Specify version (27 for 2.7, 35 for 3.5 and so on)
-e | --extra <file>     : Give file with newline-separated PyPi packages to be installed
-h | --help             : Print this help message and exit
```

Then, simply run `wine pyinstaller [options for pyinstaller]`.

# Move (Wine) development environment

Just copy the `~/.wine` folder to the new machine.

# A note on architecture

This script produces 32-bit executables no matter the architecture of the host.
