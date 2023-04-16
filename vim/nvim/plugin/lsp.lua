-- Mappings.
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local builtin = require('telescope.builtin')

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', function() builtin.lsp_implementations({ show_line = false }) end, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', function() builtin.lsp_references({ show_line = false }) end,
        { noremap = true, silent = true })
    vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<C-a>', function() vim.lsp.buf.code_action { async = true } end, bufopts)
end

vim.keymap.set('n', '<C-p>', ':ClangFormat<CR>', { noremap = true })

local mason = require "mason"
local mason_lspconfig = require "mason-lspconfig"
local lspconfig = require "lspconfig"
local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lspconfig.gopls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig.clangd.setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

local servers = {
    "jsonls",
    "lua_ls",
    "lemminx"
}

mason.setup {
    ui = {
        -- Whether to automatically check for new versions when opening the :Mason window.
        check_outdated_packages_on_open = false,
        border = "single",
        icons = {
            package_pending = "? ",
            package_installed = "? ",
            package_uninstalled = "? ",
        },
    },
}

mason_lspconfig.setup {
    ensure_installed = servers,
}

mason_lspconfig.setup_handlers {
    function(server_name)
        local opts = {
            on_attach = on_attach,
            flags = lsp_flags,
        }

        local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
        if require_ok then
            opts = vim.tbl_deep_extend("force", server, opts)
        end

        lspconfig[server_name].setup(opts)
    end,
}


local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})


-- cmp
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

require("nvim-autopairs").setup {}
-- (Optional) Configure lua language server for neovim
lsp.setup_nvim_cmp({
    preselect = 'none',
    completion = {
        completeopt = 'menu, menuone, noinsert, noselect'
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    })
})

lsp.nvim_workspace()
lsp.setup()

-- Diagnostic
vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = false,
    underline = true,
})

--require'lspconfig'.gopls.setup()
require "lsp_signature".setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    floating_window = false,
    handler_opts = {
        border = "rounded",
    }
})
