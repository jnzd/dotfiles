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
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'tpope/vim-commentary'
  Plug 'kana/vim-textobj-user' " requirement for vim-textobj-comment
  Plug 'glts/vim-textobj-comment'
  Plug 'cespare/vim-toml'
call plug#end()

set nu rnu
" save swap and ~ files in dedicated `vimtmp` directory
" requires the existence of `vimtmp` directory in the home directory
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set noundofile
set guioptions-=m "menu bar
set guioptions-=T "toolbar
set guioptions-=L "left scrollbar
set guioptions-=r "scrollbar
let g:airline_theme='minimalist'
colorscheme onedark
set t_ut=
set encoding=utf-8
set splitbelow
set splitright

" sensible window movement controls
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>H :vertical res -5 <CR>
nnoremap <Leader>J :res -5 <CR>
nnoremap <Leader>K :res +5 <CR>
nnoremap <Leader>L :vertical res +5 <CR>

" sensible remaps
" make Y behave like other captial letters
nnoremap Y y$

" keep cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-d> <C-d>zzzv
nnoremap <C-u> <C-u>zzzv

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

vnoremap > >gv
vnoremap < <gv

" Redo
nnoremap U <C-r>

" fzf
nnoremap <C-p> :Files <CR>

set shiftwidth=2
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set clipboard=unnamed
" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

if has('linux')
  " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
  let s:opam_share_dir = system("opam config var share")
  let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

  let s:opam_configuration = {}

  function! OpamConfOcpIndent()
    execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
  endfunction
  let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

  function! OpamConfOcpIndex()
    execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
  endfunction
  let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

  function! OpamConfMerlin()
    let l:dir = s:opam_share_dir . "/merlin/vim"
    execute "set rtp+=" . l:dir
  endfunction
  let s:opam_configuration['merlin'] = function('OpamConfMerlin')

  let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
  let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
  let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
  for tool in s:opam_packages
    " Respect package order (merlin should be after ocp-index)
    if count(s:opam_available_tools, tool) > 0
      call s:opam_configuration[tool]()
    endif
  endfor
  " ## end of OPAM user-setup addition for vim / base ## keep this line
endif
