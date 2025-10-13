local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'eslint',
        'clangd',
        'lua_ls',
        'rust_analyzer',
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'nvim_lsp' },
    },
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc="Go to definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc="Hover definition" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts, { desc="Workspace symbols" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts, { desc="Fload diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc="Next diagnostic" })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc="Prev diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts, { desc="Code actions" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts, { desc="Show references" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts, { desc="Rename variable" })
    vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<Leader>qf", function()
        vim.diagnostic.setloclist({ open = false })
        local window = vim.api.nvim_get_current_win()
        vim.cmd.lwindow()
        vim.api.nvim_set_current_win(window)
    end, { buffer = bufnr })
end, { desc="Diagnostics QuickFix" })

lsp.setup()
