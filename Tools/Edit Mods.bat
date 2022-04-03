:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

call backend\settings.bat
setlocal EnableDelayedExpansion

:: type and version
:type
cd %~dp0
call backend\specific.bat

:: %action%
:action
echo [32minstall or uninstall
set /p action="[92mAction: [0m"
cls

:: %site%
:site
if "%action%"=="install" (
	echo [32mmodrinth or curseforge
	set /p site="[92mSite: [0m"
) else (
	if "%action%"=="uninstall" (
		set site=
	)
)
cls

:: %mod%
:mod
echo [32mType: [0m%type% [32m^(type "change-type" to change^)
echo [32mMinecraft version: [0m%version% [32m^(type "change-type" to change^)
echo [32mAction: [0m%action% [32m^(type "change-action" to change^)
if "%action%"=="install" (
	echo [32mSite: [0m%site% [32m^(type "change-site" to change^)
)
echo.
set /p mod="[92mMod name: [0m"
cls

:: change-site
if "%mod%"=="change-site" (
	goto site
) else (
	:: change-action
	if "%mod%"=="change-action" (
		goto action
	) else (
		if "%mod%"=="change-type" (
			goto type
		)
	)
)

:: Display inputted mod
echo [32mMod: [0m%mod%
echo.

:: Install/uninstall specified mod
packwiz %site% %action% %mod%
echo.
echo.

:: Input a new mod
goto mod