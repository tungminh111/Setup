nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <C-l> 15l 
nnoremap <C-h> 15h

call plug#begin('~/Users/minhsn22/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'easymotion/vim-easymotion'
	Plug 'ryanoasis/vim-devicons'
	Plug 'ayu-theme/ayu-vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set termguicolors    
let ayucolor="light"
colorscheme ayu

set nu

set clipboard=unnamedplus

" Syntax
set autoindent
set si "smart indent
syntax on


" Disable backup file
set nobackup
set nowb
set noswapfile
set backupdir=~/tmp,/tmp
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=/tmp

" style
set encoding=utf8
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h12

" easymotion
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
