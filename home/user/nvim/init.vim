" TODO: split out into multiple files
" at least a plugins.vim for Plug and a config.vim for stuff like set mouse=a

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

autocmd TermOpen * startinsert " automatically start terminals in insert mode because honestly that's the only mode you need to use them in

filetype plugin indent on
syntax enable
colorscheme slate 

" vim-plug setup
call plug#begin('~/.nvim/vim_plug_folder')
    " lsps (rust,deno,etc)
    Plug 'neovim/nvim-lspconfig'
    " better pairing
    Plug 'jiangmiao/auto-pairs'
    " better root directorys - not just the current folder
    Plug 'airblade/vim-rooter'
    " might be useless
    Plug 'simrat39/rust-tools.nvim'
    " git add_hunk
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
    " autofmt
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'
    " CoC  -- useful for deno and others
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'Olical/conjure', {'tag': 'v4.23.0'} " clojure plugin make sure to check for releases later
    
    " Couldn't get this to work:
    " make clojure plugin less of a pain in the *ss
    "Plug 'tpope/vim-dispatch'
    "Plug 'clojure-vim/vim-jack-in'
    "Plug 'Radenling/vim-dispatch-neovim'
call plug#end()

call glaive#Install()

" more autofmt
" Glaive codefmt plugin[mappings]

" lsp setup  
lua require'lspconfig'.rust_analyzer.setup({})
lua require'gitsigns'.setup({})

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
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
