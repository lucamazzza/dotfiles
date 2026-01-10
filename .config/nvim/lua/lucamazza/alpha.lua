-- alpha-config.lua

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                                       ]],
    [[                                                                       ]],
    [[                                                                       ]],
	[[                                                                     ]],
	[[       ████ ██████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      █████████ ███████████████████ ███   ███████████   ]],
	[[     █████████  ███    █████████████ █████ ██████████████   ]],
	[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
	[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
	[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
	[[                                                                       ]],
}

 dashboard.section.buttons.val = {
   dashboard.button("<leader>pf", "􀕹 [ ] Find file", ":Telescope find_files <CR>"),
   dashboard.button("<leader>n",  "􀣘 [ ] New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("<leader>e",  "􀫿 [ ] Open Sidebar", ":Neotree <CR>"),
   dashboard.button("<leader>ps", "􀉀 [ ] Find text", ":Telescope live_grep <CR>"),
   dashboard.button("<C-p>",      "􀙡 [ ] Git files", ":Telescope git_files <CR>"),
   dashboard.button("<leader>q",  "􀷄 [ ] Quit Neovim", ":qa<CR>"),
}

local function footer()
    return os.date "􀉉  %d-%m-%Y  􀐬  %H:%M"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Number"
dashboard.section.header.opts.hl = "Error"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
