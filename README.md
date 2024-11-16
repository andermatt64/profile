# profile (November 2024)
Modern Windows profile that documents and provides PowerShell scripts to setup my optimal development environment.

## Installation 
To enable local account creation, run <kbd>Shift</kbd> + <kbd>F10</kbd> during the account creation screen and then run:
```pwsh
oobe\bypassnro
```

## Post-Installation
### Debloating
Default Windows 11 Pro install is extremely bloated with a lot of extraneous features that are more distracting than necessary.

[https://github.com/Raphire/Win11Debloat](Win11Debloat)

### Optional Uninstalls
* `Microsoft.OneDrive`

### Manual Installation
Unfortunately, not all steps in this procedure are automatable via PowerShell. There are some steps that need manual action

#### Minimum [https://www.nerdfonts.com/font-downloads](Nerd Fonts) Install Base
* FireCode Nerd Font
* JetBrainsMono Nerd Font
* MesloLG Nerd Font

#### Non-winget Applications
* Mozilla Firefox Stable
* Visual Studio Community
  * Include _Git for Windows_
* Ghidra

#### MacOS-like "Natural Scrolling" for mouse scrollwheel
