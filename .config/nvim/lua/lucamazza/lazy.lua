local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'nvim-lua/plenary.nvim' },
    {
        'goolord/alpha-nvim',
        config = function() require('lucamazza.alpha') end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ':TSUpdate',
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = { 'bash', 'c', 'cpp', 'html', 'lua', 'markdown', 'markdown_inline', 'vim', 'vimdoc', 'java', 'query' },
            auto_install = true,
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local mode_map = {
                ['n'] = '􀖆  ',
                ['no'] = '􀍠 ',
                ['nov'] = '􀍠 ',
                ['noV'] = '􀍠 ',
                ['no'] = '􀍠 ',
                ['niI'] = '􀖆  ',
                ['niR'] = '􀖆  ',
                ['niV'] = '􀖆  ',
                ['nt'] = '􀖆  ',
                ['v'] = '􀹃 ',
                ['vs'] = '􀹃 ',
                ['V'] = '􁎢 ',
                ['Vs'] = '􁎢 ',
                ['s'] = '􀡅 ',
                ['s'] = '􂇏 ',
                ['S'] = '􀐩 ',
                [''] = '􀑠 ',
                ['i'] = '􀈊 ',
                ['ic'] = '􀈊 ',
                ['ix'] = '􀈊 ',
                ['R'] = '􁝀 ',
                ['Rc'] = '􁝀 ',
                ['Rx'] = '􁝀 ',
                ['Rv'] = '􁚜 ',
                ['Rvc'] = '􁚜 ',
                ['Rvx'] = '􁚜 ',
                ['c'] = '􀆔 ',
                ['cv'] = '􀐳 ',
                ['ce'] = '􀐳 ',
                ['r'] = '􁝀 ',
                ['rm'] = '􀍡 ',
                ['r?'] = '􀇺 ',
                ['!'] = '􁕔 ',
                ['t'] = '􀩼 ',
            }
            vim.o.showmode = false
            require('lualine').setup {
                options = {
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                    theme = 'rose-pine'
                },
                sections = {
                    lualine_a = { { function() return mode_map[vim.api.nvim_get_mode().mode] or "__" end, padding = 1 } },
                    lualine_y = { { 'diagnostics', symbols = { error = '􀘰  ', warn = '􀇿  ', info = '􁊈  ', hint = '􁇗  ' } } },
                    lualine_z = { { 'location', separator = { left = '', right = ' ' }, left_padding = 2 } },
                },
                extensions = { 'quickfix', 'fzf', 'mason', 'fugitive' },
            }
        end
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        config = function()
            vim.cmd('colorscheme rose-pine')
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local lsp = require('lsp-zero')
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = "Go to definition" })
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = "Hover definition" })
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts,
                    { desc = "Workspace symbols" })
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts,
                    { desc = "Float diagnostics" })
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = "Next diagnostic" })
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = "Prev diagnostic" })
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts,
                    { desc = "Code actions" })
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts,
                    { desc = "Show references" })
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts,
                    { desc = "Rename variable" })
                vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = { 'eslint', 'clangd', 'lua_ls', 'rust_analyzer' },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                },
            })

            local cmp = require('cmp')
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<C-Space>'] = cmp.mapping.complete(),
                }),
                sources = { { name = 'nvim_lsp' } },
            })
        end
    },
    {
        'sanathks/workspace.nvim',
        config = function()
            local workspace = require("workspace")
            workspace.setup({
                workspaces = {
                    { name = "Work",     path = "~/Projects",         keymap = { "<leader>w" } },
                    { name = "School",   path = "~/School",           keymap = { "<leader>s" } },
                    { name = "Archive",  path = "~/Archive",          keymap = { "<leader>a" } },
                    { name = "Dotfiles", path = "~/dotfiles/.config", keymap = { "<leader>z" } },
                }
            })
            vim.keymap.set('n', '<leader>ts', workspace.tmux_sessions)
        end
    },
    {
        'theprimeagen/harpoon',
        config = function()
            require("harpoon").setup({
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 80,
                    height = vim.api.nvim_win_get_height(0) - 40,
                }
            })
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")
            vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
            vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files)
            vim.keymap.set('n', '<C-p>', builtin.git_files)
            vim.keymap.set('n', '<leader>pg', builtin.live_grep)
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end, { desc = "Grep string" })
            vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Copy to + reg" })
            vim.keymap.set('n', '<leader>t', builtin.builtin, { desc = 'Telescope' })
            vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
            vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
            require('telescope').setup({
                defaults = {
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                }
            })
            local signs = { Error = "􀘰 ", Warn = "􀇿 ", Hint = "􁇗 ", Info = "􁊈 " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end
        end
    },
    { 'kosayoda/nvim-lightbulb', config = function() require("nvim-lightbulb").setup({ autocmd = { enabled = true } }) end },
    {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup {
                cursorline = { enable = true, timeout = 1000 },
                cursorword = { enable = true, min_length = 3, hl = { underline = true } }
            }
        end
    },
    { 'prichrd/netrw.nvim',       config = true },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
        config = function()
            vim.keymap.set("n", "<leader>e", "<Cmd>Neotree<CR>")
            require('neo-tree').setup({ -- Your extensive config here
                enable_git_status = true,
                enable_diagnostics = true,
            })
        end
    },
    { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' },                                      config = true },
    { 'mbbill/undotree',          config = function() vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle) end },
    { 'lewis6991/gitsigns.nvim',  config = true },
    { 'j-hui/fidget.nvim',        config = true },
    { 'folke/lsp-colors.nvim',    config = true },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },
})
