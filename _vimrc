""""""""""" Set tab to 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


""""""""""" Display line numbers
:set nu


""""""""""" Disable error bells
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


""""""""""" Key mappings
map  <C-n> :NERDTreeToggle<CR>
map  <C-p> :find 
" xmap  <C-q> :wq<CR>

""" from Andrew
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l
nmap <C-l> gt
nmap <C-h> gT


""""""""""" Close vim when NERDTree is the only split left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""""""""""" Open NERDTree by default
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


""""""""""" Start Enable Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set The runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'vim-syntastic/syntastic'
" Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""""" End Enable Vundle


set nocompatible              " be iMproved, required
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '"' . $VIMRUNTIME . '\diff"'
      let eq = '""'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

