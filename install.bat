cd C:\tools\vim
rm _vimrc
mklink _vimrc %~dp0\windows\vimrc
rm vimrc
mklink vimrc %~dp0\windows\vimrc
cd C:\Users\%username%\vimfiles
rm vimrc
mklink vimrc %~dp0\windows\vimrc
cd C:\tools\neovim\Neovim\share\nvim
rm sysinit.vim
mklink sysinit.vim %~dp0\windows\sysinit.vim
cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
rm macros.ahk
mklink macros.ahk %~dp0\windows\macros.ahk
