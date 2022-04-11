:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Settings
echo off
cls

:: QOL or OO
echo [32mQOL or OO
set /p type="[92mType: [0m"
cd "../%type%"
cls

:: Game version
if "%1"=="--version" (
	set options=
	for /f %%x in ('dir /A:D /B') do set options=!options! or %%x
	echo [32m!options:~4! or latest
	set /p version="[92mMinecraft version: [0m"
	if "!version!"=="latest" (
		(dir /AD /B /O-N >versions.txt) && 5<versions.txt (set /p version=<&5)
		del versions.txt
	)
) else (
	(dir /AD /B /O-N >versions.txt) && 5<versions.txt (set /p version=<&5)
	del versions.txt
)

:: Go to version folder
cd "%version%"
cls
