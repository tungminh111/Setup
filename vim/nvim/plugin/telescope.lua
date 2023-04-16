local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-space>', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', function() builtin.live_grep{only_sort_text=true, word_match='-w'} end, {})
require('telescope').setup{
  pickers = {
    live_grep = {
      theme = "dropdown",
      layout_config={width=0.8, height=0.7}
    },
    lsp_references = {
      theme = "dropdown",
      layout_config={width=0.8, height=0.7}
    },
    lsp_definitions = {
      theme = "dropdown",
      layout_config={width=0.8, height=0.7}
    },
    lsp_implementations = {
      theme = "dropdown",
      layout_config={width=0.8, height=0.7}
    },
  },
}
