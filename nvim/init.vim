set nocompatible
set showmatch
set ignorecase
set mouse=a
set hlsearch
set tabstop=4
" set showtabline=4 " ugly as hell don't uncomment
set expandtab
set smarttab
set smartindent
set shiftwidth=4
set autoindent
set number
set wildmode=longest,list
set conceallevel=0
set laststatus=0
set updatetime=300
set autochdir
set noshowmode

filetype plugin indent on
syntax enable
colorscheme ron 

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
    " CoC 
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

call glaive#Install()

" more autofmt
" Glaive codefmt plugin[mappings]

" lsp setup  
lua require'lspconfig'.rust_analyzer.setup({})
lua require'gitsigns'.setup({})

" copy-pasted from autofmt README
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
