vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20"
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.list = true -- Enable list mode to show invisible characters
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣'
}
vim.opt.autochdir = false
vim.opt.autoindent = true


vim.g.mapleader = " "

-- Undercurl support
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
