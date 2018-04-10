" Plugins:
call plug#begin()    
    " Tree view
    Plug 'scrooloose/nerdtree'
    " Git integration to nerdtree
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " One theme
    Plug 'rakr/vim-one'
    " Configurable line
    Plug 'itchyny/lightline.vim'
    " Lint
    Plug 'w0rp/ale'
    " Auto completition Deopete
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi' " For python
    " Auto save
    Plug '907th/vim-auto-save'
    " Auto pair bracets
    Plug 'jiangmiao/auto-pairs'
    " Highlight syntax of .vue files
    Plug 'posva/vim-vue'
    " Auto close tags
    Plug 'alvan/vim-closetag'
call plug#end()

" Use deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" Vim auto save setup
let g:auto_save = 1
let g:auto_save_write_all_buffers = 1

" Don't litter my drive with .swp files
" set directory=~/.vim/tmp

" UI config
set number
set cursorline
set colorcolumn=80,120
syntax on
filetype indent plugin on
colorscheme one " Theme
set background=light
" Set transparent background
" hi Normal guibg=NONE ctermbg=NONE

" Use system clipboard
set clipboard^=unnamed,unnamedplus

" Default indentation - 4 spaces
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
" Indentation for different filetypes - 2 spaces
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" Lightline configuration
let g:lightline = {
\    'colorscheme': 'one',
\    'active': {
\        'right': [ 
\           ['lineinfo', ], 
\           [], 
\           [ 'fileencoding', 'filetype'] ]
\	 },
\    'inactive': {
\	     'right': [['lineinfo'], [], [] ]
\    },
\    'component_function': {
\        'filetype': 'LightlineFiletype',
\        'fileencoding': 'LightlineFileencoding',
\        'mode': 'LightlineMode',
\        'filename': 'LightlineFilename',
\    }}
" Hide filetype and fileencoding when width < 50
function! LightlineFiletype()
    return winwidth(0) > 50 ? &filetype : ''
endfunction
function! LightlineFileencoding()
    return winwidth(0) > 50 ? &fileencoding : ''
endfunction
" Additional configuration for specific plugins
function! LightlineMode()
    return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
\       expand('%:t') ==# 'ControlP' ? 'CtrlP' :
\       &filetype ==# 'unite' ? 'Unite' :
\       &filetype ==# 'nerdtree' ? 'NERDTree' :
\       lightline#mode()
endfunction
function! LightlineFilename()
    return &filetype ==# 'unite' ? unite#get_status_string() :
\       &filetype ==# 'nerdtree' ? '' :
\       expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

" NERD tree setup
autocmd vimenter * NERDTree
let g:NERDTreeWinSize = 40
" Remove help line
let NERDTreeMinimalUI=1
let NERDTreeDirArrows = 1
" Close tab if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-\> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

" ALE config
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
