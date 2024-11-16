New-Alias grep rg
Set-Alias -Name cat -Value bat -Option AllScope -Force
Remove-Item Alias:ls

function ls {
    eza --icons auto --git $args
}

function touch {
    Param(
        [Parameter(Mandatory)]
        [string] $Path
    )

    if (Test-Path -LiteralPath $Path) {
        (Get-Item -Path $Path).LastWriteTime = Get-Date
    } else {
        New-Item -Type File -Path $Path
    }
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (&starship init powershell)

Set-PSReadLineOption -Colors @{Parameter = 'Cyan'}
