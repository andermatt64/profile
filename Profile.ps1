function Install-PowerShellProfile {
    $cwd = Get-Location
    Copy-Item -Path "$cwd\Terminal\Microsoft.PowerShell_profile.ps1" -Destination "$profile"
}

function Install-Packages {
    Param(
        [Parameter(Mandatory)]
        [string[]] $packageList
    )

    $totalPackages = $packageList.Length
    $completedInstalls = 0
    
    foreach ($pkgName in $packageList) {
        Write-Progress -Activity "WinGet Package Installation" -Status "Installing $pkgName" -PercentComplete ($completedInstalls * 100 / $totalPackages)
        winget install -e --id $pkgName | Out-Null

        $completedInstalls += 1
    }
}

function Install-HelixConfiguration {
    $cwd = Get-Location
    Copy-Item -Path "$cwd\Helix\config.toml" -Destination "$env:AppData\helix\config.toml"
}

function Uninstall-Packages {
    Param(
        [Parameter(Mandatory)]
        [string[]] $packageList
    )

    $totalPackages = $packageList.Length
    $completedInstalls = 0
    
    foreach ($pkgName in $packageList) {
        Write-Progress -Activity "WinGet Package Uninstallation" -Status "Uninstalling $pkgName" -PercentComplete ($completedInstalls * 100 / $totalPackages)
        winget uninstall -e --id $pkgName | Out-Null
        
        $completedInstalls += 1    
    }
}

Uninstall-Packages @(
    "Microsoft.OneDrive"
    "MSIX\Microsoft.Windows.Photos_2024.11100.16009.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.WindowsCamera_2024.2408.1.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.GetHelp_10.2409.22951.0_x64__8wekyb3d8bbwe"
    "MSIX\microsoft.windowscommunicationsapps_16005.14326.22096.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.People_10.2202.100.0_x64__8wekyb3d8bbwe"
)

Install-Packages @(
    "Helix.Helix"
    "Golang.Go"
    "Amazon.Corretto.21.JDK"
    "Rustlang.Rustup"
    "Zig.zig"
    "Zigtools.zls"

    "WerWolv.ImHex"
    "Microsoft.WinDbg"
    "dnSpyEx.dnSpy"

    "tamasft.taplo"
    "BurntSushi.ripgrep.MSVC"
    "sharkdp.hexyl"
    "sharkdp.pastel"
    "sharkdp.bat"
    "bootandy.dust"
    "Wilfred.difftastic"
    "jqlang.jq"
    "eza-community.eza"
    "ajeetdsouza.zoxide"
    "Starship.Starship"
    
    "M2Team.NanaZip"
    "dbeaver.dbeaver"
    "OpenStreetMap.Josm"
)
Install-HelixConfiguration
Install-PowerShellProfile
