let g:mucomplete#enable_auto_at_startup = 1
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert
set shortmess+=c
set belloff+=ctrlg

let g:mucomplete#can_complete = {
  \ 'default': {
  \    'omni': { t -> strlen(&l:omnifunc) > 0 && t =~# '\%(\k\k\|\.\)$' }
  \    }
  \  }
