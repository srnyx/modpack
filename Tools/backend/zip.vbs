' DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING '
' DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING '
' DO NOT CHANGE ANYTHING IN THIS FILE UNLESS YOU KNOW WHAT YOU'RE DOING '

' Get command-line arguments.
Set objArgs = WScript.Arguments
Set FS = CreateObject("Scripting.FileSystemObject")
ZipFile = FS.GetAbsolutePathName(objArgs(1))

' Create an empty ZIP.
FS.CreateTextFile(ZipFile, True).Write "PK" & Chr(5) & Chr(6) & String(18, vbNullChar)

' Copy files into empty ZIP.
Set objShell = CreateObject("Shell.Application")
objShell.NameSpace(ZipFile).CopyHere(objShell.NameSpace(FS.GetAbsolutePathName(objArgs(0))).Items)

' If the script randomly fails or the ZIP file is not complete, increase this to more than 2 seconds (2000).
wScript.Sleep 2000