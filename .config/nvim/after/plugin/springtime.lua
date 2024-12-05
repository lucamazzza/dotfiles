require("springtime").setup({
    dialog = {
        -- The keymap used to select radio buttons (normal mode)
        selection_keymap = "<C-Space>",

        -- The keymap used to generate the Spring project (normal mode)
        generate_keymap = "<C-i>",

        -- If you want confirmation before generate the Spring project
        confirmation = true,

        -- Highlight links to Title and sections for changing colors
        style = {
            title_link = "Boolean",
            section_link = "Type"
        }
    }
})
