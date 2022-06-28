:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

setlocal EnableDelayedExpansion

:: type and version
:type
cd %~dp0
call backend\selection.bat

:: %action%
:action
echo [32minstall or uninstall or update
set /p action="[92mAction: [0m"
cls

:: %site%
:site
if "%action%"=="install" (
	echo [32mmodrinth or curseforge
	set /p site="[92mSite: [0m"
) else (
	set site=
)
cls

:: %mod%
:mod
if not "%action%"=="update" (
	echo [32mCurrent directory: [0m%CD%
	echo.
	echo [32mType: [0m%type% [32m^(type "change-type" to change^)
	echo [32mMinecraft version: [0m%version% [32m^(type "change-type" to change^)
	echo [32mAction: [0m%action% [32m^(type "change-action" to change^)
	if "%action%"=="install" (
		echo [32mSite: [0m%site% [32m^(type "change-site" to change^)
	)
	echo.
	set /p mod="[92mMod name: [0m"
) else (
	set mod=
)
cls

:: change-site
if "%mod%"=="change-site" (
	goto site
) else (
	:: change-action
	if "%mod%"=="change-action" (
		goto action
	) else (
		:: change-type
		if "%mod%"=="change-type" (
			goto type
		)
	)
)

:: If %action% is update, skip mod install/uninstall
if "%action%"=="update" goto update

:: Display inputted mod
echo [32mMod: [0m%mod%
echo.

:: Install/uninstall specified mod
packwiz %site% %action% %mod%
goto end

:: Update mods
:update
packwiz update -a

:: Go back to beginning
:end
echo [92m
pause
cls
if "%action%"=="update" (
	goto type
) else (
	goto mod
)