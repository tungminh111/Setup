vim.opt.termguicolors = true
vim.g.ayucolor = 'light'
vim.cmd 'colorscheme ayu'
vim.cmd 'hi! Normal ctermbg=NONE guibg=NONE'
--vim.cmd 'hi VertSplit ctermbg=Gray guibg=Gray'

vim.o.cursorline=true
vim.cmd 'hi cursorline cterm=none term=none'
vim.cmd 'highlight CursorLine guibg=LightBlue ctermbg=234'
vim.cmd 'hi Visual  guibg=LightYellow'

-- style
vim.g.encoding = 'utf8'
vim.opt.guifont = { "Hack Nerd Font", "h16" }

-- Syntax
vim.g.autoindent = true
vim.g.si ='smart indent'
vim.cmd 'syntax on'
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.cmd 'hi def IlluminatedWordText gui=bold guifg=Red'
