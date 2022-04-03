:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Do latest version stuff (true if latest, false if specific)
if %1==true (
	:: Delete old resourcepack
	set pack="config\yosbr\resourcepacks\Mod Menu Resources.zip"
	del !pack!
	echo.
	
	:: ZIP resourcepacks files
	set backend=%~dp0
	CScript !backend!zip.vbs "!backend!..\..\Mod Menu Resources" !pack!
	echo.
)

:: Generate modrinth files
packwiz modrinth export
echo.

:: Generate CurseForge files
packwiz curseforge export
echo.

:: Delete old output folder
set output="%~dp0..\output"
del /Q %output%
echo.

:: Move generated files to output folder
move "srnyx's Modpack*.*" %output%
echo.

:: Open output folder
explorer %output%
echo.