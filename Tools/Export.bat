:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

setlocal EnableDelayedExpansion

:: Selection for the modpack type and version
call backend\selection.bat

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
del "srnyx's Modpack-*.mrpack"
echo [92m--- Modrinth Export ---[32m
%backend%\packwiz modrinth export
echo.

:: Generate CurseForge files
del "srnyx's Modpack-*.zip"
echo [92m--- CurseForge Export ---[32m
%backend%\packwiz curseforge export

:: Delete old output folder
set output="%backend%\..\_output"
del /Q %output%

:: Move generated files to the new output folder
mkdir "%output%"
move "srnyx's Modpack*.*" %output%

:: Open output folder
explorer %output%