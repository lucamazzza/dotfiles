local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>t', builtin.builtin, { desc = 'Telescope' })
vim.keymap.set('n', '<leader>dd', builtin.diagnostics, { desc = 'Telescope diagnostics'})
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })

local signs = { Error = "􀘰 ", Warn = "􀇿 ", Hint = "􁇗 ", Info = "􁊈 " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

