" DOTFILES
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
call plug#end()
"
let g:airline_theme='minimalist'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"set guifont=MesloLGS\ NF:h16
set nu rnu
"set shell=
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set noundofile
set guioptions-=m "menu bar
set guioptions-=T "toolbar
set guioptions-=L "left scrollbar
set guioptions-=r "scrollbar
let g:material_theme_style = 'darker'
colo material
set t_ut=
set encoding=utf-8
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
