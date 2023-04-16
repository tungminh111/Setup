set scrolloff=10
let vimDir = '$HOME/Users/minhsn22/.local/share/nvim'

call plug#begin(vimDir.'/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'easymotion/vim-easymotion'
	Plug 'ryanoasis/vim-devicons'
	Plug '907th/vim-auto-save'
    Plug 'junegunn/seoul256.vim'
	Plug 'rhysd/vim-clang-format'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'neovim/nvim-lspconfig'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

colo seoul256-light
hi! Normal ctermbg=NONE guibg=NONE

set termguicolors    
set nu
noremap <silent> tn :tabnew <CR>
noremap <silent> fp :let @+ = expand('%:p') <CR>
set stl=%{expand('%:~:.')}%{FugitiveStatusline()}-%{bufnr('%')}

set cursorline
hi cursorline cterm=none term=none
highlight CursorLine guibg=#e8eaed ctermbg=234



" Syntax
set autoindent
set si "smart indent
syntax on

" set modifiable
set ma

" LSP

" prettier
nnoremap <C-p> :ClangFormat <CR>
nnoremap <C-f> :Format<CR>

