set number
set hidden
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set rtp+=~/.fzf
set shell=/usr/bin/bash
set scrolloff=5

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
    
call plug#begin()
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed
Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js' 
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
call plug#end()

colorscheme nightfox
set termguicolors

" prettier 
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" js specific formatting
autocmd FileType javascript call JavascriptSettings()

function! JavascriptSettings()
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=2
endfunction

nmap <C-n> :bn<CR>  " Next buffer in list
nmap <C-p> :bp<CR>  " Previous buffer in list

lua << EOF
require('lualine').setup{};
require("bufferline").setup{}
EOF
