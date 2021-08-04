Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Zash
Set-Alias -Name vi -Value nvim
Set-Alias -Name vim -Value gvim
Set-Alias -Name vimdiff -Value gvimdiff

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
# comment added in PowerShell 
# comment added in PowerShell Preview
