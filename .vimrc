set nocompatible
set nu
syntax on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'powerline/powerline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'

call plug#end()

" ***** Plugins config *****
"
" Nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='\r'
"
" Powerline
set laststatus=2
set t_Co=256
set showtabline=2

autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab"
