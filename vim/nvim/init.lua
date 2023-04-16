vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.clipboard='unnamed'
vim.g.auto_save=1
vim.keymap.set('n','O','o<Esc>')
vim.cmd('set mouse=')

-- persistent undo
vim.opt.undofile=true
vim.opt.undodir= '~/Users/minhsn22/.local/share/nvim/undodir'

-- no backup
vim.g.nobackup = true
vim.gnowb = true
vim.gnoswapfile = true
vim.gbackupdir='~/tmp,/tmp'
vim.gbackupcopy=yes
vim.gbackupskip='/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*'
vim.gdirectory='/tmp'

-- new tab
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>0', ':tablast<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', {noremap=true})

-- copy current buffer path
vim.api.nvim_set_keymap('n', 'fp', ':let @+ = expand(\'%:p\') <CR>', {noremap=true})

require('packer_plug')
