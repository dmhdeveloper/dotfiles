" VIM CONFIG "

" Syntax Highlighting "
syntax on

" Change tab length
set tabstop=2
set shiftwidth=2
set expandtab

filetype off

" Non compatibale with VI "
set nocompatible

" Set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle :P
Plugin 'gmarik/Vundle.vim'

" File browsing
Plugin 'scrooloose/nerdtree'

call vundle#end()

" Plugin support "
filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

command! MakeTags !ctags -R . 

nmap <F6> :NERDTreeToggle<CR>
