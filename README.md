# zerohub

Zero Hub is a script hub designed to give users the ability to run scripts in a package. It allows users to not use scripts when the game in question is updated.

Here is the process of what you should expect when you run Zero Hub.

1. Checking for valid game
2. Checking if the valid game is not updated, and is concurrent with the current script version.
3. Asks the user whether they would like to run the script anyways, (***RISK***), or cancel.
4. If the game version is up to date with script version, no extra options will be needed.

Loader Code:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vzurxy/zerohub/master/loader.lua"))()
```

Things to note:

Zero Hub's UI is open source, however the developers of Zero-Hub may choose to obfuscate the script, or not.

Changelogs:
- Updated Zero Hub to version 1.0.0a.
