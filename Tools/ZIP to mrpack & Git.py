import os
from zipfile import ZipFile
from pathlib import Path
import toml # pip install toml

git_path = os.path.expanduser("~") + "/Desktop/Stuff/GitHub/modpack/QOL"
packwiz_path = git_path + "/Packwiz/1.17.1/"
packwiz_exe = "packwiz.exe"
mods_path = packwiz_path + "mods"

refresh_only = False

def extract_file(from_zip, from_file, to_path, from_desc):
    with ZipFile(from_zip, 'r') as zip:
        if from_file in zip.namelist():
                zip.extract(from_file, to_path)
                print("Copied " + from_desc + " to Git")
        else:
            print("Skipped " + from_desc + " copying to Git, didn't exist")

if refresh_only == False:
    for item in os.listdir(mods_path):
        os.remove( os.path.join(mods_path, item))

os.chdir(packwiz_path)

if refresh_only == False:
    cf_zip_path = input("Please drag the CurseForge zip file here: ")[3:][:-1] # Because dragging the file adds "& " and double quotes
    
    # Update pack.toml first
    with open("pack.toml", "r") as f:
        pack_toml = toml.load(f)
    pack_version = "-".join(str(Path(cf_zip_path).with_suffix("")).split("-")[1:])
    pack_toml["version"] = pack_version
    with open("pack.toml", "w") as f:
        toml.dump(pack_toml, f)

    # Packwiz import
    os.system(packwiz_exe + " curseforge import \"" + cf_zip_path + "\"")
    
    # Copy fresh manifest/modlist to Git
    extract_file(cf_zip_path, "manifest.json", git_path + "/CurseForge", "CurseForge manifest.json")
    extract_file(cf_zip_path, "modlist.html", git_path + "/CurseForge", "CurseForge modlist.html")

os.system(packwiz_exe + " refresh")

# Export Modrinth pack and manifest
os.system(packwiz_exe + " modrinth export")
for pack in os.listdir(packwiz_path):
    if pack.endswith('.mrpack'):
        extract_file(packwiz_path + "/" + pack, "modrinth.index.json", git_path + "/Modrinth", "Modrinth manifest")
        os.replace(packwiz_path + "/" + pack, os.path.expanduser("~/Desktop") + "/" + pack)
        print("Moved " + pack + " to desktop")

os.system(packwiz_exe + " refresh")
