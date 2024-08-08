# my functions
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

# my aliases
remove-alias r

# VIM mode
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

# starship prompt
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml"
$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp"
Invoke-Expression (&starship init powershell)

# FZF
Enable-PsFzfAliases
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
# replace tab expansion with fzf
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }


# GITHUB COPILOT CLI - https://github.blog/changelog/2024-03-21-github-copilot-general-availability-in-the-cli/

function ghcs {
        # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
        # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
        param(
                [ValidateSet('gh', 'git', 'shell')]
                [Alias('t')]
                [String]$Target = 'shell',

                [Parameter(Position=0, ValueFromRemainingArguments)]
                [string]$Prompt
        )
        begin {
                # Create temporary file to store potential command user wants to execute when exiting
                $executeCommandFile = New-TemporaryFile

                # Store original value of GH_DEBUG environment variable
                $envGhDebug = $Env:GH_DEBUG
        }
        process {
                if ($PSBoundParameters['Debug']) {
                        $Env:GH_DEBUG = 'api'
                }

                gh copilot.exe suggest -t $Target -s "$executeCommandFile" $Prompt
        }
        end {
                # Execute command contained within temporary file if it is not empty
                if ($executeCommandFile.Length -gt 0) {
                        # Extract command to execute from temporary file
                        $executeCommand = (Get-Content -Path $executeCommandFile -Raw).Trim()

                        # Insert command into PowerShell up/down arrow key history
                        [Microsoft.PowerShell.PSConsoleReadLine]::AddToHistory($executeCommand)

                        # Insert command into PowerShell history
                        $now = Get-Date
                        $executeCommandHistoryItem = [PSCustomObject]@{
                                CommandLine = $executeCommand
                                ExecutionStatus = [Management.Automation.Runspaces.PipelineState]::NotStarted
                                StartExecutionTime = $now
                                EndExecutionTime = $now.AddSeconds(1)
                        }
                        Add-History -InputObject $executeCommandHistoryItem

                        # Execute command
                        Write-Host "`n"
                        Invoke-Expression $executeCommand
                }
        }
        clean {
                # Clean up temporary file used to store potential command user wants to execute when exiting
                Remove-Item -Path $executeCommandFile

                # Restore GH_DEBUG environment variable to its original value
                $Env:GH_DEBUG = $envGhDebug
        }
}

function ghce {
        # Debug support provided by common PowerShell function parameters, which is natively aliased as -d or -db
        # https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-7.4#-debug
        param(
                [Parameter(Position=0, ValueFromRemainingArguments)]
                [string[]]$Prompt
        )
        begin {
                # Store original value of GH_DEBUG environment variable
                $envGhDebug = $Env:GH_DEBUG
        }
        process {
                if ($PSBoundParameters['Debug']) {
                        $Env:GH_DEBUG = 'api'
                }

                gh copilot.exe explain $Prompt
        }
        clean {
                # Restore GH_DEBUG environment variable to its original value
                $Env:GH_DEBUG = $envGhDebug
        }
}

fnm env --use-on-cd | Out-String | Invoke-Expression