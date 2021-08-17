set home=C:\Users\%username%
set vimtmp=%home%\vimtmp
set vimfiles=%home%\vimfiles
set vim=C:\tools\vim
set nvim=C:\tools\neovim\Neovim\share\nvim
set start="C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

:: set up vim
if exist %vim% ^
(
  if not exist %vimtmp% ^
  (
    mkdir %vimtmp%
  )
  if exist %vim%\_vimrc del %vim%\_vimrc
  if exist %vim%\vimrc del %vim%\vimrc
  :: %~dp0 is the script directory
  mklink %vim%\_vimrc %~dp0\vimrc
  mklink %vim%\vimrc %~dp0\vimrc
  if exist %vimfiles ^
  (
    cd %vimfiles%
    del vimrc
    mklink vimrc %~dp0\vimrc
  )
)

:: set up neovim
if exist %nvim% ^
(
  if not exist %vimtmp% ^
  (
    mkdir %vimtmp%
  )
  del %nvim%\sysinit.vim
  mklink %nvim%\sysinit.vim %~dp0\vimrc
)

:: add ahk script to autostart
if exist %start%\macros.ahk del %start%\macros.ahk
mklink %start%\macros.ahk %~dp0\windows\macros.ahk
