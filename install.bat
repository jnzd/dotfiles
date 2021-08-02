cd C:\tools\vim
del _vimrc
mklink _vimrc %~dp0\windows\vimrc
del vimrc
mklink vimrc %~dp0\windows\vimrc
cd C:\Users\%username%\vimfiles
del vimrc
mklink vimrc %~dp0\windows\vimrc
cd C:\tools\neovim\Neovim\share\nvim
del sysinit.vim
mklink sysinit.vim %~dp0\windows\sysinit.vim
cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
del macros.ahk
mklink macros.ahk %~dp0\windows\macros.ahk
