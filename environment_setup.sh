#!/bin/bash

# Copyright (c) 2016 bharadwaj-raju. All Rights Reserved.

# Apache License 2.0

while [[ $# > 1 ]]
do
key="$1"

show_help() {
    cat << EOF
    Usage: environment_setup.sh [options]

    Options:

    -p | --python <version> : Specify version (27 for 2.7, 35 for 3.5 and so on)
    -e | --extra <file>     : Give file with newline-separated PyPi packages to be installed
    -h | --help             : Print this help message and exit

    EOF

}

case $key in
    -p|--python)
    VERSION="$2"
    shift # past argument
    ;;
    -e|--extra)
    EXTRA_PKGS_FILE="$2"
    shift
    ;;
    -h|--help)
    show_help

    exit
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

if [ "$VERSION" == "27" ] then
    wget -O pysetup.msi https://www.python.org/ftp/python/2.7.10/python-2.7.10.msi

    wine msiexec /qn pysetup.msi

    setx \M PATH "%PATH%;C:\Python\Python27;C:\Python\Python27\Scripts"

    wine pip install pypiwin32

elif [ "$VERSION" == "35" ] then
    wget -O pysetup.exe https://www.python.org/ftp/python/3.5.1/python-3.5.1.exe

    wine pysetup.exe /quiet PrependPath=1

    wine pip install pypiwin32

else
    echo "No Python version specified!"

    show_help

    exit 1

# Install each package specified in EXTRA_PKGS_FILE with pip

while read PKG
do
    wine pip install "$PKG"
done < "EXTRA_PKGS_FILE"

wine pip install pyinstaller

cat << END

Python, PyWin32, and all pypi packages in the file (if any) have been installed.

Now, simply run 'wine pyinstaller [options]'.

END
