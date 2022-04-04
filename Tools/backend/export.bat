:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: %backend%
set backend=%~dp0

:: Do latest version stuff (true if latest, false if specific)
if %1==true (
	:: Delete old resourcepack
	set pack="config\yosbr\resourcepacks\Mod Menu Resources.zip"
	del !pack!
	echo.
	
	:: ZIP resourcepacks files
	CScript %backend%zip.vbs "%backend%..\..\Mod Menu Resources" !pack!
)

:: Generate modrinth files
%backend%packwiz modrinth export
echo.

:: Generate CurseForge files
%backend%packwiz curseforge export
echo.

:: Delete old output folder
set output="%backend%..\output"
del /Q %output%
echo.

:: Move generated files to a new output folder
mkdir "%output%"
move "srnyx's Modpack*.*" %output%
echo.

:: Open output folder
explorer %output%
echo.