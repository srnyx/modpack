:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

setlocal EnableDelayedExpansion

:: Selection for the modpack type and get latest version
call backend\selection.bat

:: Run the export script
call "%~dp0backend\export.bat" --latest
