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
        ---------------------------------------------------------------------------------------------------------------
        ---- LaTeX                                                                                                 ----
        ---------------------------------------------------------------------------------------------------------------
        ls.add_snippets("tex", {
            -- figure
            s({
                trig = "figure",
                name = "LaTeX Figure",
                desc = "Generate a figure in LaTeX",
            },{
                t("\\begin{figure}[h]"),
                t({"", "\\centering"}),
                t({"", "\\includegraphics[width="}),
                i(1, "0.8"),
                t("\\textwidth]{"),
                i(2),
                t("}"),
                t({"", "\\caption{"}),
                i(3, "New Image"),
                t("}"),
                t({"", "\\end{figure}"}),
            }),
            -- table
            s({
                trig = "table",
                name = "LaTeX Table",
                desc = "Generate a table in LaTeX",
            }, {
                t("\\begin{table}[h]"),
                t({"", "\\centering"}),
                t({"", "\\caption{"}),
                i(3, "New Table"),
                t("}"),
                t({"", "\\begin{tabular}{@{}lp{12cm}l@{}}"}),
                t({"", "\\toprule"}),
                t({"", "\\textbf{Heading} & \\textbf{Heading} & \\textbf{Heading} \\\\ \\midrule"}),
                t({"", "% & & \\\\"}),
                i(1),
                t({"", "\\bottomrule"}),
                t({"", "\\end{tabular}"}),
                t({"", "\\end{table}"}),
            }),
            -- bullet list
            s({
                trig = "list",
                name = "LaTeX Bullet List",
                desc = "Generate a bullet list in LaTeX",
            }, {
                t("\\begin{itemize}"),
                t({"", "    \\item "}),
                i(1),
                t({"", "\\end{itemize}"}),
            }),
            -- enumeration
            s({
                trig = "enum",
                name = "LaTeX Numbered List",
                desc = "Generate a numbered list in LaTeX",
            }, {
                t("\\begin{enumerate}"),
                t({"", "    \\item "}),
                i(1),
                t({"", "\\end{enumerate}"}),
            }),
            -- inline code
            s({
                trig = "tt",
                name = "Inline Code",
                desc = "Generate inline code",
            }, {
                t("\\texttt{"),
                i(1),
                t("}"),
            }),
            -- inline bold
            s({
                trig = "bf",
                name = "Bold text",
                desc = "Make a bold text brick",
            }, {
                t("\\textbf{"),
                i(1),
                t("}"),
            }),
            -- inline bold
            s({
                trig = "it",
                name = "Italic text",
                desc = "Make an italic text brick",
            }, {
                t("\\textit{"),
                i(1),
                t("}"),
            }),
            -- glossary entry
            s({
                trig = "gls",
                name = "Glossary Entry",
                desc = "Generate a glossary entry",
            }, {
                t("\\gls{"),
                i(1),
                t("}"),
            }),
            -- sitography entry
            s({
                trig = "cite",
                name = "Sitography Citation",
                desc = "Generate a sitography citation",
            }, {
                t("\\cite{"),
                i(1),
                t("}"),
            }),
            -- footnote
            s({
                trig = "foot",
                name = "Foot Note",
                desc = "Generate a foot note",
            }, {
                t("\\footnote{"),
                i(1),
                t("}"),
            }),
            -- url footnote
            s({
                trig = "footu",
                name = "URL Foot Note",
                desc = "Generate a foot note with an URL",
            }, {
                t("\\footnote{\\url"),
                i(1),
                t("}}"),
            }),
        })

        return opts
    end,
}
