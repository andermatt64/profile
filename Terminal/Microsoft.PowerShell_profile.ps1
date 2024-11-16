New-Alias grep rg
Set-Alias -Name cat -Value bat -Option AllScope -Force
Remove-Item Alias:ls

function ls {
    eza --icons auto --git $args
}

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (&starship init powershell)

Set-PSReadLineOption -Colors @{Parameters = 'Cyan'}
