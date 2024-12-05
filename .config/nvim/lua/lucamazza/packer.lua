--This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('sharkdp/fd')
    use('BurntSushi/ripgrep')
    use('NeogitOrg/neogit')
    use('sanathks/workspace.nvim')
    use('nvim-tree/nvim-web-devicons')
    use('lervag/vimtex')
    use('rbong/vim-flog')
    use('apple/pkl-neovim')
    use('nvim-telescope/telescope-symbols.nvim')
    use('lewis6991/gitsigns.nvim')
    use('goolord/alpha-nvim')
    use('kosayoda/nvim-lightbulb')
    use('j-hui/fidget.nvim')
    use('junegunn/fzf')
    use('roobert/search-replace.nvim')
    use('prichrd/netrw.nvim')
    use('yamatsum/nvim-cursorline')
    use('CRAG666/code_runner.nvim')
    use('saecki/crates.nvim')
    use('folke/lsp-colors.nvim')
    use({
        "elmcgill/springboot-nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-jdtls"
        }
    })
    use({
        'folke/todo-comments.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    })
    use({
        'gfanto/fzf-lsp.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    })
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    })
    use({
        'javiorfo/nvim-springtime',
        requires = {
            "javiorfo/nvim-popcorn",
            "javiorfo/nvim-spinetta",
            "hrsh7th/nvim-cmp",
        },
        run = function()
            require 'springtime.core'.update()
        end,
    })
    use({
        'craftzdog/solarized-osaka.nvim',
        as = 'solarized-osaka',
        config = function()
            vim.cmd('colorscheme solarized-osaka')
        end
    })
    use({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
    use({
        "stevearc/quicker.nvim",
        config = function()
            require("quicker").setup()
        end,
    })
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use({
        'sudormrfbin/cheatsheet.nvim',
        requires = {
            { 'nvim-telescope/telescope.nvim' },
            { 'nvim-lua/popup.nvim' },
            { 'nvim-lua/plenary.nvim' },
        }
    })
    use({
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    })
end)
