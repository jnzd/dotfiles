# dotfiles

A repository of my configuration files

## Windows
### [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
[WSL2 Kernel update package for x64](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

[Share SSH keys between Windows and WSL](https://devblogs.microsoft.com/commandline/sharing-ssh-keys-between-windows-and-wsl-2/)
```
cp -r /mnt/c/Users/<username>/.ssh ~/.ssh
# fix permissions
chmod 600 ~/.ssh/id_rsa
```

### [Chocolatey](https://chocolatey.org/install)
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### [Scoop](https://scoop.sh/)
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
[Meslo Nerd Font patched for Powerlevel10k](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)

### [Oh My Posh](https://ohmyposh.dev/docs/pwsh)
```
Install-Module oh-my-posh -Scope CurrentUser
# see link for installation with scoop or winget
```

### [Vim Plug](https://github.com/junegunn/vim-plug)
Installation

Vim
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
NeoVim
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

## Linux

### [Vim Plug](https://github.com/junegunn/vim-plug)
Installation

Vim
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
NeoVim
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### [Oh My Bash](https://ohmybash.nntoan.com/)
```
# install using curl
sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# using wget
sh -c "$(wget https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```
