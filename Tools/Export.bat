:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

setlocal EnableDelayedExpansion

:: Selection for the modpack type and version
call backend\selection.bat

:: Delete export files that failed to move to output folder
del "srnyx's Modpack-*.mrpack"
del "srnyx's Modpack-*.zip"
cls

:: %backend%
set backend=%~dp0backend

:: Do latest version stuff
if "%original%"=="latest" (
	:: %pack%
	set pack="config\yosbr\resourcepacks\Mod Menu Resources.zip"

	:: Delete old resourcepack
	del !pack!
	
	:: ZIP resourcepack files
	echo [92m--- Zipping Resourcepack ---[32m
	CScript %backend%\zip.vbs "%backend%\..\..\Mod Menu Resources" !pack!
)

:: Generate modrinth files
echo [92m--- Modrinth Export ---[32m
%backend%\packwiz modrinth export
echo.

:: Generate CurseForge files
echo [92m--- CurseForge Export ---[32m
%backend%\packwiz curseforge export
echo.

:: %output%
set output="%backend%\..\_output"

:: Delete old output folder
if exist "%output%" (
	rd /Q /S %output%
)

:: Move generated files to the new output folder
echo [92m--- Move to output folder ---[32m
mkdir "%output%"
move "srnyx's Modpack*.*" %output%

:: Open output folder
explorer %output%