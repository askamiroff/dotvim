call plug#begin('~/.vim/plugged')

" Appearance
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

" File types, languages
Plug 'posva/vim-vue'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'slim-template/vim-slim'
Plug 'w0rp/ale' " Linting
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'hail2u/vim-css3-syntax'
Plug 'tomtom/tcomment_vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Code completion
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

let g:LanguageClient_serverCommands = {
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'vue': ['vls'],
  \ }

"\ 'javascript': ['/home/user/.nvm/versions/node/v8.5.0/lib/node_modules/javascript-typescript-langserver/lib/language-server-stdio.js'],
" \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/echodoc.vim'

" Other
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'qpkorr/vim-bufkill'
Plug 'mileszs/ack.vim'
Plug 'Shougo/unite.vim' " vimfiler dependency
Plug 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
"Plug 'tpope/vim-unimpaired'
"Plug 'rstacruz/vim-closer'
"Plug 'cohama/lexima.vim'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
let g:AutoPairsFlyMode = 1

" Integrations

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim' " requires vim-fugitive, :GV - open commit browser

call plug#end()

" Settings
filetype plugin indent on
syntax enable
set number
set nowrap

" Editing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set virtualedit=all

" Searching
set ignorecase

" Appearance
set noshowmode
set termguicolors
set background=dark
let g:gruvbox_contrast_dark='soft'
silent! colorscheme gruvbox

" Completion
set completeopt=longest,menuone,preview

" Other
set undofile
set directory=~/.vim/tmp " dir to place swap files in
set undodir=~/.vim/undo
set cmdheight=2
set splitright splitbelow
set fileencodings=utf-8,cp1251
set nofixendofline
set mouse=a " fix scrolling
set virtualedit=all
set nostartofline

" Functions
function! CurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        echo "> ???"
    else
        echo ">" name
    endif
endfunction

" Key bindings
let mapleader=","
nnoremap ; :
" prevent entering into visual mode
map Q <Nop>
" highlight matches
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

map gt :bn<cr>
map gT :bp<cr>
map td :BD<cr>

map <silent><F12> :VimFiler <cr>
map <silent><C-F11> :VimFiler -find<cr>
map <C-P> :FZF<cr>

" Fix random highlight disappearing
" http://vim.wikia.com/wiki/Fix_syntax_highlighting
autocmd BufEnter * :syntax sync fromstart

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

noremap  <silent> <C-S>   :w<CR>
vnoremap <silent> <C-S>   <C-C>:w<CR>
inoremap <silent> <C-S>   <C-O>:w<CR>

" Show extraspaces and tabs
highlight ExtraWhitespace guibg='#af4241'
match ExtraWhitespace /\s\+\%#\@<!$\| \t\+\%#\@<!/ " spaces and tabs

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Ale config
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'scss': ['prettier'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Enable deoplete
" call deoplete#enable()
" let g:deoplete#enable_at_startup = 1
