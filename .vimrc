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

" Plugin support "
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-g'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

command! MakeTags !ctags -R . 

nmap <F6> :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_w = 1

if !exists('g:aitline_symbols')
  let g:airline_symbols = {}
endif

" Set airline theme
let g:airline_theme = 'simple'
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = '⎇'
