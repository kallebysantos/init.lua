-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme dracula]]

return require('packer').startup(function(use)
    -- Packer can manage itself

    use 'wbthomason/packer.nvim'

    use 'Mofiqul/dracula.nvim'

    use 'nvim-tree/nvim-tree.lua'

    use 'nvim-tree/nvim-web-devicons'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('theprimeagen/harpoon')

    use('theprimeagen/vim-be-good')

    use('vim-airline/vim-airline')

    use('vim-airline/vim-airline-themes')

    use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })

    use('tpope/vim-fugitive')

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
        }
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    }
end)
