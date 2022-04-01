:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Hide commands
echo off
cls

call backend\specific.bat

:: modrinth or curseforge
:site
set /p site="[92mMod site: [0m"
cls

:: Mod name input
:mod
echo [32mType "change-site" to go back to site selection
set /p mod="[92mMod name: [0m"
cls

if "%mod%"=="change-site" (
	:: Return to site selection
	goto site
) else (
	:: Display inputted mod
	echo [32mMod: [0m%mod%
	echo.

	:: Try to install via Modrinth
	packwiz %site% install %mod%
	echo.

	:: Go back to mod input
	goto mod
)