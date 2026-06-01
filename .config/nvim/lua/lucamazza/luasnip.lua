return {
    "L3MON4D3/LuaSnip",
    enabled = true,
    opts = function(_, opts)
        local ls = require("luasnip")
        opts = vim.tbl_deep_extend("force", opts, {
            history = true,
            delete_check_events = "TextChanged",
        })

        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        local function clipboard()
            return vim.fn.getreg("+")
        end

        ---------------------------------------------------------------------------------------------------------------
        ---- C++                                                                                                   ----
        ---------------------------------------------------------------------------------------------------------------
        ls.add_snippets("cpp", {
            -- hello world
            s({
                trig = "hello",
                name = "Hello, World!",
                desc = "Print \"Hello, World!\" to the stdout",
            }, {
                t("std::cout << \"Hello, World!\" << std::endl;")
            }),

            -- class
            s({
                trig = "class",
                name = "Class blueprint",
                desc = "Creates the blueprint for a class in C++",
            }, {
                t("class "),
                i(1, "ClassName"),
                t(" {"),
                t({"", "public:", "", "    "}),
                i(2, "// Public members here..."),
                t({"", "", "private:", "", "    "}),
                i(3, "// Private members here..."),
                t({"", "", "};"}),
            }),
        })

        return opts
    end,
}
