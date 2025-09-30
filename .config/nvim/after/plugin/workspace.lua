 local workspace = require("workspace")
 workspace.setup({
    workspaces = {
        {name = "Work", path = "~/Projects", keymap = {"<leader>w"}},
        {name = "School", path = "~/School", keymap = {"<leader>s"}},
        {name = "Archive", path = "~/Archive", keymap = {"<leader>a"}},
        {name = "Dotfiles", path = "~/dotfiles/.config", keymap = {"<leader>z"}},
    }
 })
 vim.keymap.set('n', '<leader>ts', workspace.tmux_sessions)
