vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc="netrw" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc="Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc="Move line down" })

vim.keymap.set("n", "J", "mzJ`z", { desc="Append next line to current" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc="Move down fast" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc="Move up fast" })
vim.keymap.set("n", "n", "nzzzv", { desc="Go to next / match" })
vim.keymap.set("n", "N", "Nzzzv", { desc="Go to next ? match" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc="Paste from + reg" })
vim.keymap.set("n", "<leader>p", "\"+p", { desc="Paste from + reg" });

vim.keymap.set("n", "<leader>y", "\"+y", { desc="Copy to + reg" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc="Copy to + reg" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc="Copy current to + reg" })

vim.keymap.set("n", "<leader>d", "\"_d", { desc="Delete current to void reg" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc="Delete current to void reg" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end, { desc="Format file" })

vim.keymap.set("n", "<C-k>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz", { desc="Next error" })
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz", { desc="Prev error" })

vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc="Search/Replace" })

vim.keymap.set("n", "<leader>mk", "<cmd>make<CR>", { desc="make" })
vim.keymap.set("n", "<leader>cm", "<cmd>cm<CR>", { desc="cmake" })
