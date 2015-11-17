# --The Easy Executable Builder for Python

# --All credit to PyInstaller for builder - pyinstaller.org-- #

# --Credit to the wine project for the Windows environment - winehq.org-- #

# --Credit to htgoebel on GitHub for his repository virtual-wine-- #

# --Credit to PyWin32-- #

# -- Target Platform : Windows; Current Platform : Linux -- #

echo "
The Easy Executable Builder for Python
      
Target Platform : Windows; Current Platform : Linux

"

#-- Get PyInstaller

wget https://github.com/pyinstaller/pyinstaller/archive/master.zip

#Unzip it

unzip master.zip -d pyinstaller


#-- User Input

# Get python file path

read -p "Python file path: " $pypath

# Is the app GUI?

# This prevents a command window being launched before the app
# DO NOT 'YES' IN CASE OF COMMAND-BASED APP 

read -r -p "
Is it a GUI app? [y/N] " gui
case $gui in
    [yY][eE][sS]|[yY]) 
        guichoice="yes"
        ;;
    *)
        guichoice="no"
        ;;
esac


# Should we produce a single file executable?

# Includes all library/module etc files in a single executable file

# Otherwise you'll get a folder with hundreds of files

read -r -p "
Produce single bundled executable? [y/N] " sfile
case $sfile in
    [yY][eE][sS]|[yY]) 
        sfilechoice="yes"
        ;;
    *)
        sfilechoice="no"
        ;;
esac

#-- Set up a Windows environment

# Get the virtual-wine repository

wget https://github.com/htgoebel/virtual-wine/archive/master.zip

# Unzip it

unzip master.zip -d virtual-wine

# Set it up

./virtual-wine/virtual-wine-master/vwine-setup venv_wine

# Get python for Windows + PyWin32

wget https://www.python.org/ftp/python/2.7.10/python-2.7.10.msi

wget http://sourceforge.net/projects/pywin32/files/pywin32/Build%20219/pywin32-219.win32-py2.7.exe

# Start the virtual environment

./virtual-wine/virtual-wine-master/bin/activate

# Install python for Windows + PyWin32

wine msiexec -i python-2.7.10.msi

wine pywin32-219.win32-py2.7.exe

#-- Ask user to install Windows libs

echo "
We have installed a virtual Windows environment of Wine with Python and PyWin32 installed."

echo "
Now, install any non-standard Python libraries via Wine such as numpy, PyQt, PyGTK, WxPython, PySide, Matplotlib etc."

"
Press enter when all required libraries are installed."

read -p "Press enter here when ready: "

#-- Build

# PyInstaller Warnings/Errors go in 'build' directory
# PyInstaller Output goes in 'dist' directory

# Case: User wants a GUI in a single file

if [ "$guichoice" == "yes" ] && [ "$sfilechoice" == "yes" ]; then 	wine c:/Python27/python.exe pyinstaller/pyinstaller-master/pyinstaller.py --onefile --windowed ${pypath}
fi


# Case: User wants a GUI but doesn't need a single file

if [ "$guichoice" == "yes" ] && [ "$sfilechoice" == "no" ]; then 	wine c:/Python27/python.exe pyinstaller/pyinstaller-master/pyinstaller.py --windowed ${pypath}
fi


# Case: User doesn't want GUI but wants a single file

if [ "$guichoice" == "no" ] && [ "$sfilechoice" == "yes" ]; then 	wine c:/Python27/python.exe pyinstaller/pyinstaller-master/pyinstaller.py --onefile ${pypath}
fi


# Case: User doesn't want GUI or single file

if [ "$guichoice" == "no" ] && [ "$sfilechoice" = "no" ]; then 		wine c:/Python27/python.exe pyinstaller/pyinstaller-master/pyinstaller.py ${pypath}
fi

# Done!
# Let's tell the user

echo "
Any errors/warnings/logs/info generated by PyInstaller can be found in the build directory"

echo "
The build output can be found in the dist directory"
