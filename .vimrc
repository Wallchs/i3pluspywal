if has("syntax")
  syntax on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set sm
set wildmode=longest,list:full
set hls


cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu


"As configurações seguem o mesmo padrão da lista de instalações dos plugins
call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ajh17/spacegray.vim'
Plug 'ervandew/supertab'
Plug 'mattn/emmet-vim'
Plug 'nathanaelkane/vim-indent-guides'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/syntastic'
Plug 'skammer/vim-css-color'
"outros temas para sintaxes
Plug 'flazz/vim-colorschemes'

call plug#end()

"Nerdtree customização


autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



"Vim-airline configuração

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

"Airline tema
let g:airline_theme='dark'

"colorscheme
set t_Co=256 
set termguicolors
colorscheme wal
"let g:spacegray_use_italics = 1
"let g:spacegray_low_contrast = 1
"let g:spacegray_underline_search = 1


"Supertab
"eu  uso por padrão o <tab> mas se quiser mudar apague essa linha e altere

"Emmet configuração
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"Indent guides configurações

let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4


"Deoplete configuração

let g:deoplete#enable_at_startup = 1

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"Syntastic configuração
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"css
let g:cssColorVimDoNotMessMyUpdatetime = 1
