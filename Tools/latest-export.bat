:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Find and set the latest version
cd ../%1
(dir /AD /B /O-N >versions.txt) && 5<versions.txt (set /p version=<&5)
del versions.txt

:: Delete old resourcepack and generate new one
cd "%version%"
set pack=config/yosbr/resourcepacks/Mod Menu Resources.zip
del "%pack%"
set tools=%~dp0
CScript %tools%zip.vbs "%tools%../Mod Menu Resources" "%pack%"

:: Run export.bat
cd %tools%
export.bat "%1" "%version%"