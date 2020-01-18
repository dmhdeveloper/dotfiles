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

filetype plugin on

" Non compatibale with VI
set nocompatible

" Set the runtime path to include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle :P
Plugin 'gmarik/Vundle.vim'

" File browsing
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

" Plugin support
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-g'
Plugin 'prettier/vim-prettier', {'do': 'npm install'}
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'lifepillar/vim-mucomplete'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dmhdeveloper/ocean.vim'

call vundle#end()

filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

" Load all plugin specific configuration
for f in split(glob('~/dotfiles/vim/plugin-config/*.vim'), '\n')
  exe 'source' f
endfor

" NERDTree mapping
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" vim-go mappings
autocmd FileType go nnoremap <buffer> <leader>b :GoBuild<CR>
autocmd FileType go nnoremap <buffer> <leader>t :GoAlternate<CR>
autocmd FileType go nnoremap <buffer> <leader>c :GoCoverageToggle<CR>
autocmd FileType go nnoremap <buffer> <leader>d :GoDoc<CR>
autocmd FileType go nnoremap <buffer> <leader>ds :GoDescribe<CR>
autocmd FileType go nnoremap <buffer> <leader>gr :GoRun<CR>

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
