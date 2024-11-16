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

### Automated Installation
> NOTE: 

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

#### Windows Terminal Settings
| Setting Name | Setting Value                |
| ------------ | ---------------------------- |
| Color Scheme | Spring                       |
| Font Family  | JetBrainsMono Nerd Font Mono |
| Font Size    | 9                            |
| Opacity      | 90                           |
| Padding      | 8                            |

##### Preferred Color Scheme (Spring by Gogh)
```json
        {
            "background": "#0A1E24",
            "black": "#000000",
            "blue": "#1DD3EE",
            "brightBlack": "#000000",
            "brightBlue": "#15A9FD",
            "brightCyan": "#3E999F",
            "brightGreen": "#1FC231",
            "brightPurple": "#8959A8",
            "brightRed": "#FF0021",
            "brightWhite": "#FFFFFF",
            "brightYellow": "#D5B807",
            "cursorColor": "#ECF0C1",
            "cyan": "#3E999F",
            "foreground": "#ECF0C1",
            "green": "#1F8C3B",
            "name": "Spring",
            "purple": "#8959A8",
            "red": "#FF4D83",
            "selectionBackground": "#FFFFFF",
            "white": "#FFFFFF",
            "yellow": "#1FC95B"
        }
```

#### Rust Development Environment
TODO

#### Golang Development Environment
TODO

#### Ghidra Environment Setup
TODO

#### MacOS-like "Natural Scrolling" for mouse scrollwheel
TODO
