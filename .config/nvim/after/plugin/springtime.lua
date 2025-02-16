require("springtime").setup({
    spring = {
        project = {
            selected = 3
        },
        language = {
            selected = 1
        },
        packaging = {
            selected = 1
        },
        project_metadata = {
            group = "ch.mazluc",
            artifact = "demo",
            name = "demo",
            package_name = "ch.mazluc.demo",
            version = "0.0.1-SNAPSHOT"
        },
        spring_boot = {
            selected = 2,
            values = {
                "3.4.1-SNAPSHOT",
                "3.4.0",
                "3.3.7-SNAPSHOT",
                "3.3.6"
            }
        },
        java_version = {
            selected = 1,
            values = {23, 21, 17}
        }
    },
    dialog = {
        -- The keymap used to select radio buttons (normal mode)
        selection_keymap = "<CR>",

        -- The keymap used to generate the Spring project (normal mode)
        generate_keymap = "<C-i>",

        -- If you want confirmation before generate the Spring project
        confirmation = true,

        -- Highlight links to Title and sections for changing colors
        style = {
            title_link = "Boolean",
            section_link = "Type"
        }
    },
    workspace = {
        path = vim.fn.expand("%:p:h"),
        decompress = true,
        open_auto = true
    },
    internal = {
        log_debug = true
    }
})
