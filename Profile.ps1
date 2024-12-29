function Install-PowerShellProfile {
    $cwd = Get-Location
    New-Item -ItemType File -Path "$profile" -Force | Out-Null
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
    $helixConfPath = "$env:AppData\helix\config.toml"
    
    New-Item -ItemType File -Path "$helixConfPath" -Force | Out-Null
    Copy-Item -Path "$cwd\Helix\config.toml" -Destination "$helixConfPath"
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
    "MSIX\microsoft.windowscommunicationsapps_16005.11629.20316.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.People_10.1902.633.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.OutlookForWindows_1.2024.1023.300_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.YourPhone_1.24102.96.0_x64__8wekyb3d8bbwe"
    "MSIX\Microsoft.GamingApp_2411.1001.6.0_x64__8wekyb3d8bbwe"
)

Install-Packages @(
    "Helix.Helix"
    "GoLang.Go"
    "Amazon.Corretto.21.JDK"
    "Rustlang.Rustup"
    "zig.zig"
    "zigtools.zls"
    "LLVM.clangd"

    "WerWolv.ImHex"
    "Microsoft.WinDbg"
    "dnSpyEx.dnSpy"

    "Microsoft.Sysinternals.Autoruns"
    "Microsoft.Sysinternals.FindLinks"
    "Microsoft.Sysinternals.ProcessExplorer"
    "Microsoft.Sysinternals.ProcessMonitor"
    "Microsoft.Sysinternals.Strings"
    "Microsoft.Sysinternals.TCPView"
    "Microsoft.Sysinternals.Sigcheck"

    "tamasfe.taplo"
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
