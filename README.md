# Endless Void
Endless Void is a fully functional level builder for Void Stranger. 

You can create your own levels with it, and upload them to a server (a [Voyager](https://github.com/hexfae/voyager) instance).

This repository contains its project file, the UndertaleModTool script used to merge it into the game (`merger.csx`), 
UndertaleModTool scripts to add and remove game assets from the project (located in the `/assetscripts` folder), and patches applied to the game on-merge (`/patches`).

The project is set up like this, as opposed to just a plain UndertaleModTool mod, for several reasons:
- Much faster iteration
- When the game updates, it will be trivial to update with it
- Ability to use GameMaker's animation curves (in a non-painful way)
- Ability to use things that the UndertaleModTool (de)compiler would usually not like (in a non-painful way)
- Ability to open-source the project (:

## Installing
To install this mod, you'll need an application that can do xdelta patching. I recommend [Delta Patcher.](https://www.romhacking.net/utilities/704/)

- Go to the [latest release](https://github.com/Skirlez/void-stranger-endless-void/releases/latest) and grab the .xdelta file which matches your copy (Steam/itch.io).
- Apply the xdelta patch to Void Stranger's data.win file, which is found in its installation folder.  (On Steam, right-click the game, Manage->Browse local files) **Make sure it's the original, vanilla data.win. If you previously installed this mod, or any other mod, restore the original data.win first.** in order to uninstall the mod, bring back the original data.win in any way (either keep a backup, or on Steam, find and press the "verify integrity of the game files" button).

Your save file will not be touched by the mod, and you can install and uninstall the mod without anything happening to it. Have fun!

## Compiling
Endless Void targets [UndertaleModTool 0.6.1.0](https://github.com/UnderminersTeam/UndertaleModTool/releases/tag/0.6.1.0). I'd recommend not getting the SingleFile version
as it has caused issues for some in the past. ***Make sure to replace the paths at the top of the UMT scripts with your own!***

To compile Endless Void:
- Download and install GameMaker 2023.4.0.84 from GameMaker's legacy [release notes](https://gms.yoyogames.com/ReleaseNotes.html) page. Void Stranger was compiled with the 2023.4 runtime
- Run the `copier.csx` script on Void Stranger's data.win from the `/assetscripts` folder to copy all the required Void Stranger assets into the GameMaker project
- From this point you can build and run the editor on its own inside GameMaker. You won't be able to play levels, but it is useful when developing the UI
- To merge the editor into the game, build Endless Void in GameMaker and extract its data.win, run the `merger.csx` script on Void Stranger's data.win, and save it when it's done
- You have compiled Endless Void

For developers on Linux:
- an Ubuntu build of 2023.4.0.84 does seem to exist and function! The button for it on the release notes page is just missing, for some mysterious reason. Obtain it by changing the extension in macOS release link to `.deb` (or click [here](https://gms.yoyogames.com/GameMaker-2023.4.0.84.deb))

## Things of note about the code
- Indices of objects, sprites, sounds, etc. become mismatched when merging with Void Stranger, so references to them are always obtained with `asset_get_index()`.
This does not apply to animation curves, as Void Stranger never uses them, and so their indicies are not offset.
- Semicolons are lightly and inconsistently sprinkled throughout, because of muscle memory, but GameMaker does not enforce them...
- It's uh, pretty good, occasionally.

## Contributing
Please contribute