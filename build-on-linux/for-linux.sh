# --The Easy Executable Builder for Python-- #

# --All credit to PyInstaller for builder - pyinstaller.org-- #

# -- Target Platform : Linux; Current Platform : Linux -- #

echo "
The Easy Executable Builder for Python

Target Platform : Linux; Current Platform : Linux

"

#-- Check distro



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


#-- Build

# PyInstaller Warnings/Errors go in 'build' directory
# PyInstaller Output goes in 'dist' directory

# Case: User wants a GUI in a single file

if [ "$guichoice" == "yes" ] && [ "$sfilechoice" == "yes" ]; then 	pyinstaller/pyinstaller-master/pyinstaller.py --windowed --onefile ${pypath}
fi


# Case: User wants a GUI but doesn't need a single file

if [ "$guichoice" == "yes" ] && [ "$sfilechoice" == "no" ]; then 	pyinstaller/pyinstaller-master/pyinstaller.py --windowed ${pypath}
fi


# Case: User doesn't want GUI but wants a single file

if [ "$guichoice" == "no" ] && [ "$sfilechoice" == "yes" ]; then 	pyinstaller/pyinstaller-master/pyinstaller.py --onefile ${pypath}
fi


# Case: User doesn't want GUI or single file

if [ "$guichoice" == "no" ] && [ "$sfilechoice" = "no" ]; then 		pyinstaller/pyinstaller-master/pyinstaller.py ${pypath}
fi

# Done!
#-- Let's tell the user

echo "
Any errors/warnings/logs/info generated by PyInstaller can be found in the build directory"

echo "
The build output can be found in the dist directory"
