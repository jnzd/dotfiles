Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Zash
function eth { set-location ~/onedrive/documents/eth }

function search {
  Write-Host -ForegroundColor 11 "search $($args[0]) in Chocolatey" && 
  choco search $($args[0]) && 
  Write-Host -ForegroundColor 11 "`nsearch $($args[0]) in Scoop" && 
  scoop search $($args[0]) && 
  Write-Host -ForegroundColor 11 "search $($args[0]) in Winget" && 
  winget search $($args[0]) `
}

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
