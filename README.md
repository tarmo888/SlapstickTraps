**Slapstick Traps** is a rage game, which illustrates my experience with learning **Unreal Engine 5** so far - there has been bear traps at every corner. The key is to learn from mistakes and try to not repeat them, you should get better the more you practice. Your failures might make you swear, but others laugh. It's meant to be more fun to watch than play.

There is a twist at the end of the level.

This game was made during **GGJ 2024**, which theme was "[Make Me Laugh](https://youtu.be/_xPgv9ZAQSo)".

Updated on 2026-11-18 with web build. 

## Similar games
Cat Mario and Trap Adventure.

## Controls
* **A/D** or **Left/Right** for movement.
* **Space** for jumping and double-**Space** for double-jumping (duh).
* **ESC** or **Backspace** to get back to menu.

## Assets used
* http://tinyurl.com/Unreal2DTemplates
* https://ansimuz.itch.io/sunny-land-pixel-game-art
* https://freesound.org/

## Team members
* Tarmo Annus - programming
* Henri Rand - level design
* Sander Prisk - sound design

## Technology Notes
Built with Unreal Engine 5.9 using Paper2D and Unreal Motion Graphics (UMG). Windows uses Direct3D 12, while the WebAssembly build uses WebGPU. Both builds use the ES 3.1 feature level and forward renderer.

## Install instructions
For Windows, download Slapstick-build.zip from GitHub, extract the zip file and execute Slapstick.exe
For browser (preferably Chrome), download Slapstick-play.zip from GitHub, extract the zip file and execute Play_Slapstick.bat or play-slapstick.sh

If your browser can't run the web version, you need enable one of these flags (use at your own risk):
```
chrome://flags/#ignore-gpu-blocklist
chrome://flags/#enable-unsafe-webgpu
```

## Source code
The web build needs a C++ project, so the game has an empty C++ module. If you don't need the web build and want a Blueprint-only project again (no C++ compiler needed):
1. Delete the `Source` folder.
2. Delete the `"Modules"` section from `Slapstick.uproject`.
3. Delete the `Binaries` and `Intermediate` folders (if they exist).