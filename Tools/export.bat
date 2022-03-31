:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

:: Go to specified folder
cd "../%1/%2"

:: Delete old mrpack and generate new one
del "srnyx's Modpack *.mrpack"
packwiz modrinth export

:: Delete old zip and generate new one
del "srnyx's Modpack *.zip"
packwiz curseforge export

:: Delete old output folder and create new
set output=%~dp0output
del /Q %output%
mkdir %output%

:: Move generated files to %output%
move "srnyx's Modpack*.*" "%output%"

:: Open output folder
explorer "%output%"