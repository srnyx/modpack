# srnyx's Modpack Repository

Welcome to my repository.
Here you'll find the resources for:

* Curseforge modpack [(read more)](https://support.curseforge.com/en/support/solutions/articles/9000196904-creating-a-custom-profile)
* Packwiz files [(read more)](https://github.com/comp500/packwiz#packwiz)
* Modrinth files [(read more)](https://github.com/Madis0/fabulously-optimized/issues/63)
* Changelog, license, README, etc...
* GitHub meta files in `.github` [(read more)](https://stackoverflow.com/a/61301254)

Other things to note:

* As seen in the `.gitignore` file, this repo will not include JAR files of any kind to respect the modders. If you want to build a pack based on this, get the JARs manually via any method you like (CurseForge, Modrinth, packwiz, etc...).
   * Because there are no JARs, some folders would usually not be uploaded by Git at all, this is worked around using a `.gitkeep` file [(read more)](https://stackoverflow.com/a/7229996) to keep the folder structure.
* Since some folders are duplicated - such as config folders, I am using Windows-like soft symlinks [(read more)](https://blogs.windows.com/windowsdeveloper/2016/12/02/symlinks-windows-10/). Those don't work very well in GitHub, so I recommend using a [local Git client](https://desktop.github.com).
