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

[Win11Debloat](https://github.com/Raphire/Win11Debloat)

### Automated Installation
> **NOTE**: To enable PowerShell scripts, run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` 

Run the following command to install required packages, remove unnecessary ones default _Win11Debloat_ ignored, and setup Helix/PowerShell configuration.

```powershell
.\Profile.ps1
```

## Manual Installation
Unfortunately, not all steps in this procedure are automatable via PowerShell. There are some steps that need manual action

### Minimum [Nerd Fonts](https://www.nerdfonts.com/font-downloads) Install Base
* FiraCode Nerd Font
* JetBrainsMono Nerd Font
* MesloLG Nerd Font

### Other Fonts (Google Fonts)
* B612
* B612 Mono
* Ubuntu
* Questrial

### Non-winget Applications
* Mozilla Firefox Stable
* Visual Studio Community
  * Include _Git for Windows_
* Ghidra

### Windows Terminal Settings
| Setting Name   | Setting Value                |
| :---           |                         ---: |
| _Color Scheme_ |                       Spring |
| _Font Family_  | JetBrainsMono Nerd Font Mono |
| _Font Size_    |                            9 |
| _Opacity_      |                           90 |
| _Padding_      |                            8 |

**Preferred Color Scheme**
[_Spring by Gogh_](https://gogh-co.github.io/Gogh)
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

### Use 24-hour clock format
In **Settings** &rarr; **Time & language** &rarr; **Regional format**, make **Short time** and **Long time** reflect the desired 24-hour format.

### Disable Edge from running in the background when closed
In _Microsoft Edge_, go into **Settings** &rarr; **System and performacne* and make sure **Startup boost** and **Continue running background extensionms and apps when Microsoft Edge is closed** are disabled.

### Rust Development Environment
```powershell
rustup default stable
rustup component add rust-analyzer
```

### Golang Development Environment
```powershell
go install golang.org/x/tools/gopls@latest
go install github.com/nametake/golangci-lint-langserver@latest
```

### WSL2 Debian + Nix Setup
Install Debian WSL2:
```pwsh
wsl --install -d Debian
```
Once inside the Debian WSL2 instance, install the following packages:
* `build-essential`
* `curl`
* `git`
* `openssh-client`
* `python3`

At this point, we are ready to grab [andermatt64/dotfiles](https://github.com/andermatt64/dotfiles) and setup the development environment. Once installed, add `commandline` key at the location specified below in Windows Terminal Settings JSON file: 
```json
{
  "defaultProfile": "{<GUID>}",

  "profiles": {
    "list": [
      {
        "commandline": "wsl -d Debian --cd <HOME_DIR> -- <HOME_DIR>/.nix-profile/bin/fish",
        "guid": "{<GUID>}",
        "hidden": false,
        "name": "Debian"
      }
    ]
  }
}
```

### Ghidra Environment Setup
In the **Function Graph** window, click **Edit Code Layout** button. In the opened dialog, click the **Instruction/Data** tab and resize the bars to make sure no text is hidden.

In **Edit** &rarr; **Tool Options**, make the following changes:
* **Options**
  * **Decompiler**
    * **Display**
      * Change **Font** to _JetBrainsMonoNL NFM_
      * Enable **Display EOL comments**
      * Set **Display Namespaces** to _Always_
  * **Listing Display**
    * Change **Font** to _JetBrainsMonoNL NFM_
  * **Graph**
    * **Function Graph**
      * Set **Graph Background Color** to _#F2FFFF_
      * Enable **Scroll Wheel Pans**
      * Set **View Settings** to _Start Fully Zoomed In_
      * **Nested Code Layout**
        * Enable **Route Edges Around Vertices**
  * **Listing Fields**
    * **Cursor Text Highlights**
      * Change **Mouse Button To Activate** to _LEFT_ 
    * **Function Signature Field**
      * Enable **Display Namespace**
    * **Operands Field** 
      * Disable **Markup Register Variable References**
