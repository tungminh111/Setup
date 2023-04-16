return require('packer').startup(function()
		use 'wbthomason/packer.nvim'
		--use 'junegunn/seoul256.vim'
        use 'ayu-theme/ayu-vim'
		use '907th/vim-auto-save'
		use 'rhysd/vim-clang-format'
		use 'easymotion/vim-easymotion'
        use 'vim-airline/vim-airline'
        use 'RRethy/vim-illuminate'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'tpope/vim-fugitive'
        --use 'jiangmiao/auto-pairs'
        use 'ray-x/lsp_signature.nvim'
        use {
            "windwp/nvim-autopairs",
        }
		use {
		  'nvim-tree/nvim-tree.lua',
		  requires = {
		    'nvim-tree/nvim-web-devicons', -- optional, for file icons
		  },
		  tag = 'nightly' -- optional, updated every week. (see issue #1193)
		}
        use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v1.x',
          requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
          }
        }
        use 'nvim-treesitter/nvim-treesitter'
end)
