 local workspace = require("workspace")
 workspace.setup({
    workspaces = {
        {name = "Work", path = "~/Projects", keymap = {"<leader>w"}},
        {name = "School", path = "~/School", keymap = {"<leader>s"}},
    }
 })
 vim.keymap.set('n', '<leader>ts', workspace.tmux_sessions)
