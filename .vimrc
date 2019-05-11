" VIM CONFIG "

" Syntax Highlighting "
syntax on

" Change tab length
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set wildmenu
set hidden
set showtabline=1

filetype plugin on

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
Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'szw/vim-g'
Plugin 'prettier/vim-prettier', {'do': 'npm install'}
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'lifepillar/vim-mucomplete'

call vundle#end()

filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

command! MakeTags !ctags -R . 

nmap <F6> :NERDTreeToggle<CR>
autocmd FileType go nnoremap <buffer> <leader>b :GoBuild<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Set airline theme
let g:airline_theme = 'simple'
let g:airline_powerline_fonts = 1
let g:airline_symbols.branch = '⎇'

" Airline settings
let g:airline#extentions#tabline#enabled = 1

" Vim go settings
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet','golint']
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_auto_type_info = 1
let g:go_list_type = 'quickfix'

" Mucomplete settings
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
let g:mucomplete#enable_auto_at_startup = 1
set shortmess+=c
set belloff+=ctrlg
