vim.g.EasyMotion_do_mapping = 0
vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {noremap=true})
vim.g.EasyMotion_smartcase = 1
vim.api.nvim_set_keymap('', '<Leader>j', '<Plug>(easymotion-j)', {noremap=true})
vim.api.nvim_set_keymap('', '<Leader>k', '<Plug>(easymotion-k)', {noremap=true})
