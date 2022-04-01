:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Do latest version stuff (true if latest, false if specific)
setlocal EnableDelayedExpansion
if %1==true (
	:: Delete old resourcepack
	set pack="config\yosbr\resourcepacks\Mod Menu Resources.zip"
	del !pack!
	
	:: ZIP resourcepacks files
	set backend=%~dp0
	CScript !backend!zip.vbs "!backend!..\..\Mod Menu Resources" !pack!
	
	:: Run common commands
	goto common
) else (goto common)

:common
:: Generate modrinth files
packwiz modrinth export

:: Generate CurseForge files
packwiz curseforge export

:: Delete old output folder
set output="%~dp0..\output"
del /Q %output%

:: Move generated files to output folder
move "srnyx's Modpack*.*" %output%

:: Open output folder
explorer %output%

pause