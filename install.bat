set home=C:\Users\%username%
set vimtmp=%home%\vimtmp
set vimfiles=%home%\vimfiles
set vim=C:\tools\vim
set nvim1=C:\tools\neovim\nvim-win64\share\nvim
set nvim2="C:\Program Files\Neovim\share\nvim"
set start="C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
set glaze=%home%\.glaze-wm

REM %~dp0 is the script directory
REM the :~0,-1% removes the trailing backslash using substrings
set dotfiles=%~dp0
set dotfiles=%dotfiles:~0,-1%

REM set up vim
if exist %vim% (^
  if not exist %vimtmp% mkdir %vimtmp%
  if exist %vim%\_vimrc del %vim%\_vimrc
  if exist %vim%\vimrc del %vim%\vimrc
  mklink %vim%\_vimrc %dotfiles%\vimrc
  mklink %vim%\vimrc %dotfiles%\vimrc
  if exist %vimfiles% (^
    del %vimfiles%\vimrc
    mklink %vimfiles%\vimrc %dotfiles%\vimrc
  )
)

REM set up neovim if installed with Chocolatey
if exist %nvim1% (^
  if not exist %vimtmp% mkdir %vimtmp%
  if exist %nvim1%\sysinit.vim del %nvim1%\sysinit.vim
  mklink %nvim1%\sysinit.vim %dotfiles%\vimrc
)
REM set up neovim if installed with msi installer
if exist %nvim2% (^
  if not exist %vimtmp% mkdir %vimtmp%
  if exist %nvim2%\sysinit.vim del %nvim2%\sysinit.vim
  mklink %nvim2%\sysinit.vim %dotfiles%\vimrc
)

REM add ahk script to autostart
if exist %start%\macros.ahk del %start%\macros.ahk
mklink %start%\macros.ahk %dotfiles%\windows\macros.ahk

REM copy glaze-wm config
if exist %glaze% if exist %glaze%\config.yaml del %home%\config.yaml
copy %dotfiles%\windows\.glaze-wm\config.yaml %glaze%\config.yaml
