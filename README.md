# dotfiles

A repository of my configuration files

## Windows
### [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
[WSL2 Kernel update package for x64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

[Share SSH keys between Windows and WSL](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)

```bash
cp -r /mnt/c/Users/<username>/.ssh ~/.ssh
# fix permissions
chmod 600 ~/.ssh/id_rsa
```

### [Chocolatey](https://chocolatey.org/install)
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### [Scoop](https://scoop.sh/)
```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# or shorter
iwr -useb get.scoop.sh | iex
```
**Note**: if you get an error you might need to change the execution policy (i.e. enable Powershell) with

```powershell
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```

### Fonts
[Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

### [Vim Plug](https://github.com/junegunn/vim-plug)
Installation

Vim
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
NeoVim
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

## Linux

### [Vim Plug](https://github.com/junegunn/vim-plug)
Installation

Vim
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
NeoVim
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```