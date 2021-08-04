"DOTFILES
syntax on
" set leader key to spacebar
nnoremap <SPACE> <Nop>
let mapleader=" "
if (has('win 64') || has('win32'))
  " Windows specific
  set shell=\"C:\Program\ Files\PowerShell\7\pwsh.exe\"
  set guifont=MesloLGS\ NF:h10
  if !has('nvim')
    " Vim with all enhancements
    source $VIMRUNTIME/vimrc_example.vim
  endif
elseif has('linux')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

if has('gui_running')
  autocmd GUIEnter * set vb t_vb=
endif

call plug#begin('~/.vim/plugged')
  Plug 'tpope/vim-sensible'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()

set nu rnu
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set noundofile
set guioptions-=m "menu bar
set guioptions-=T "toolbar
set guioptions-=L "left scrollbar
set guioptions-=r "scrollbar
let g:airline_theme='minimalist'
let g:material_theme_style = 'darker'
colo material
set t_ut=
set encoding=utf-8
set splitbelow
set splitright

" sensible window movement controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" sensible remaps
" make Y behave like other captial letters
nnoremap Y y$

" keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap { {<c-g>u
inoremap ( (<c-g>u

" moving text
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


set shiftwidth=2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set clipboard=unnamed
" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
