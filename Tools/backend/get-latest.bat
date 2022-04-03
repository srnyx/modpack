:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Set type
set type=%1
cd "../%type%"

:: Get latest version
(dir /AD /B /O-N >versions.txt) && 5<versions.txt (set /p version=<&5)
del versions.txt

:: Go to "type/version" folder
cd "%version%"