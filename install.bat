set home=C:\Users\%username%
set vimtmp=%home%\vimtmp
set vimfiles=%home%\vimfiles
set vim=C:\tools\vim
set nvim=C:\tools\neovim\Neovim\share\nvim
set start="C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

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

REM set up neovim
if exist %nvim% (^
  if not exist %vimtmp% mkdir %vimtmp%
  if exist %nvim%\sysinit.vim del %nvim%\sysinit.vim
  mklink %nvim%\sysinit.vim %dotfiles%\vimrc
)

REM add ahk script to autostart
if exist %start%\macros.ahk del %start%\macros.ahk
mklink %start%\macros.ahk %dotfiles%\windows\macros.ahk
