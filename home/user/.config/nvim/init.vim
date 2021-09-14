set nocompatible
set showmatch
set ignorecase
set mouse=a
set hlsearch
set tabstop=4
" set showtabline=4 " ugly as hell don't uncomment
set expandtab
set smartindent
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list " useable autocompletion
set smarttab " Idek actually
set conceallevel=0
set laststatus=0
set updatetime=300
set autochdir
set noshowmode
" make windows split on side hopefully
set splitright
set splitbelow

let maplocalleader=","
set timeoutlen=50000 " TODO: figure out if this is necesarry

map t "_d
map tt "_dd

highlight NormalFloat ctermbg=black guibg=black

filetype plugin indent on

syntax enable
if $TERM == "xterm-256color"
    colorscheme slate
elseif $TERM == "xterm-kitty"
    colorscheme default
endif

" install plugins here
call plug#begin(stdpath('data') . '/plugged')
" lsps (rust,deno,etc)
Plug 'neovim/nvim-lspconfig'
" better pairing
Plug 'jiangmiao/auto-pairs'
" better root directorys - not just the current folder
Plug 'airblade/vim-rooter'
" git stuff 
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim' | Plug 'lewis6991/gitsigns.nvim'
" autofmt
Plug 'google/vim-maktaba' | Plug 'google/vim-codefmt' | Plug 'google/vim-glaive' 
" CoC  -- useful for deno 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plugin for Clojure
Plug 'Olical/conjure', {'tag': 'v4.23.0'}  
" allow use of commands like :Clj, :Lein, etc 
Plug 'tpope/vim-dispatch' | Plug 'Radenling/vim-dispatch-neovim'
Plug 'clojure-vim/vim-jack-in'
" smoother pgup and pgdown - maybe not worth it
Plug 'psliwka/vim-smoothie'
" tweaked file browsing
Plug 'tpope/vim-vinegar'
" better autocompletions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
call glaive#Install()

" lsp setup  and other
lua require'lspconfig'.rust_analyzer.setup({})
lua require'gitsigns'.setup({})

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
set completeopt-=preview 

" user-added functions 
fu! NTerm() " a function that opens a new window with a terminal so it doesn't go over your current buffer
    vsplit
    terminal
endfunction

fu! CleanIndentation()
    normal! gg=G
endfunction

fu! CljSettings()
    set tabstop=4
endfunction

autocmd FileType clojure call CljSettings() 

" autofmt copy-paste
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
    autocmd FileType rust AutoFormatBuffer rustfmt
    autocmd FileType vue AutoFormatBuffer prettier
augroup END
