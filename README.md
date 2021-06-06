# dotfiles

A repository of my configuration files

## Windows
### WSL
[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
[WSL2 Kernel update package for x64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

### Chocolatey
[Install Chocolatey](https://chocolatey.org/install)
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Scoop
https://scoop.sh/

```
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# or shorter
iwr -useb get.scoop.sh | iex
```
**Note**: if you get an error you might need to change the execution policy (i.e. enable Powershell) with
```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```

### Fonts
From [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

[Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

### Oh My Posh
[Install Oh My Posh](https://ohmyposh.dev/docs/pwsh)
```
Install-Module oh-my-posh -Scope CurrentUser
# see link for installation with scoop or winget
```

## Linux
