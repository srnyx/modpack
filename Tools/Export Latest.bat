:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

call backend\settings.bat
setlocal EnableDelayedExpansion

:: %backend%
set backend=%~dp0backend

:: Selection for the modpack type
call backend\specific.bat

:: Get the latest version of the type
call "%backend%\get-latest.bat"

:: Run the export script
call "%backend%\export.bat" --latest