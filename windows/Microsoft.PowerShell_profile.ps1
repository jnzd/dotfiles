Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Zash
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value gvim
Set-Alias -Name vimdiff -Value gvimdiff
# PSFzf, they should already be installed, but aren't
Set-Alias -name fe -Value Invoke-FuzzyEdit
Set-Alias -name ff -Value Invoke-FuzzyFasd
Set-Alias -name fz -Value Invoke-FuzzyZLocation
Set-Alias -name fgs -Value Invoke-FuzzyGitStatus
Set-Alias -name fh -Value Invoke-FuzzyHistory
Set-Alias -name fkill -Value Invoke-FuzzyKillProcess
Set-Alias -name fd -Value Invoke-FuzzySetLocation
Set-Alias -name cde -Value Set-LocationFuzzyEverything

function eth { set-location ~/onedrive/documents/eth }

function search {
  Write-Host -ForegroundColor 11 "search $($args[0]) in Chocolatey" && 
  choco search $($args[0]) && 
  Write-Host -ForegroundColor 11 "`nsearch $($args[0]) in Scoop" && 
  scoop search $($args[0]) && 
  Write-Host -ForegroundColor 11 "`n`nsearch $($args[0]) in Winget" && 
  winget search $($args[0]) `
}

function upgrade {
  sudo choco upgrade all -y &&
  scoop update &&
  winget upgrade --all
}

function disks { GET-WMIOBJECT -query "SELECT * from Win32_DiskDrive" }
Invoke-Expression (&scoop-search --hook)

Set-PSReadLineOption -EditMode vi -viModeIndicator Cursor

function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange 
Set-PSReadLineOption -PredictionSource History -PredictionViewStyle ListView

# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# replace tab expansion with fzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
# comment added in PowerShell 
# comment added in PowerShell Preview
