:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::
:: DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING ::

call backend\settings.bat
setlocal EnableDelayedExpansion

call backend\specific.bat

call "%~dp0backend\export.bat" false