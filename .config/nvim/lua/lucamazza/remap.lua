vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc="netrw" })

-- Visual mode line moving
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc="Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc="Move line down" })

-- Navigation and Editing
vim.keymap.set("n", "J", "mzJ`z", { desc="Append next line to current" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc="Move down fast" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc="Move up fast" })
vim.keymap.set("n", "n", "nzzzv", { desc="Go to next / match" })
vim.keymap.set("n", "N", "Nzzzv", { desc="Go to next ? match" })

-- Clipboard management
vim.keymap.set("x", "<leader>p", "\"_dP", { desc="Paste over selection" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc="Paste from system" })
vim.keymap.set("n", "<leader>y", "\"+y", { desc="Copy to system" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc="Copy to system" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc="Copy line to system" })

-- Delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- LSP and Utilities
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, { desc="Format file" })
vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc="Search/Replace word under cursor" })
