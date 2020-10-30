" VIM CONFIG

" Syntax Highlighting
syntax on

" Change tab length
set tabstop=2
set shiftwidth=2
set expandtab

set guifont=SauceCodePro\ Nerd\ Font:h15:cANSI

" Show line numbers
set number
set wildmenu
set hidden
set showtabline=1

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

filetype plugin on

" Non compatibale with VI
set nocompatible

" Set the runtime path to include Vundle and initialise
call plug#begin('~/dotfiles/vim/plugged') 

" File browsing
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Plugin support
" Syntax checker :help syntastic-checkers
Plug 'vim-syntastic/syntastic'
" Formatting of golang files using gofmt :GoFmt
Plug 'darrikonn/vim-gofmt', {'do': 'GoInstallBinaries'}
" Git wrapper
Plug 'tpope/vim-fugitive'
" Quote pairs for surrounding words with quotes, parens etc.
Plug 'tpope/vim-surround'
" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" The status bar at the bottom
Plug 'vim-airline/vim-airline'
" Available themes for the status bar
Plug 'vim-airline/vim-airline-themes'
" Custom colour scheme
Plug 'dmhdeveloper/ocean.vim'
" Conqueror of completion, powerful intellisense engine that uses Language
" servers that adhere to LSP (Language server protocol)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Sql language server
Plug 'joe-re/sql-language-server', {'do': 'npm install'}
" Groovy language server
Plug 'prominic/groovy-language-server', {'do': './gradlew build'}
" Docker language server
Plug 'rcjsuen/dockerfile-language-server-nodejs', {'do': 'npm install'}
" Kotlin language server
Plug 'fwcd/kotlin-language-server', {'do': './gradlew :server:installDist'}

call plug#end()

filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

" Load all plugin specific configuration
for f in split(glob('~/dotfiles/vim/plugin-config/*.vim'), '\n')
  exe 'source' f
endfor

" File Type plugin sql support configuration
let g:omni_sql_no_default_maps = 1

" colours
set t_Co=256
" set vim terminal to 256 colors.
if filereadable(expand("/usr/share/terminfo/x/xterm-256color")) 
  let $TERM='xterm-256color'
else
  let $TERM='xterm-color'
endif
colorscheme ocean

highlight Pmenu ctermfg=15 ctermbg=16 guifg=#ffffff guibg=#0000ff
