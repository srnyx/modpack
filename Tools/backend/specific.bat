:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: QOL or OO
echo [32mQOL or OO
set /p type="[92mType: [0m"
cd "../%type%"
cls

:: Game version
if "%1"=="--version" (
	set options=
	for /f %%x in ('dir /A:D /B') do set options=!options! or %%x
	echo [32m%options:~4% or latest
	set /p version="[92mMinecraft version: [0m"
	if "%version%"=="latest" (
		call %~dp0get-latest.bat %type%
	) else (
		cd "%version%"
	)
	cls
)