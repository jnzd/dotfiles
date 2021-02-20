cd C:\tools\vim
rm _vimrc
mklink _vimrc %~dp0_vimrc
cd C:\tools\neovim\Neovim\share\nvim
rm sysinit.vim
mklink sysinit.vim %~dp0sysinit.vim
cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rm macros.ahk
mklink macros.ahk %~dp0macros.ahk