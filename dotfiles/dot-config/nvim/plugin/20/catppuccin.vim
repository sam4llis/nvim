lua << EOF

    local catppuccin = require("catppuccin")

    local settings = {
        transparent_background = false,
        term_colors = false,
        styles = {
            comments = "italic",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                        errors = "italic",
                        hints = "italic",
                        warnings = "italic",
                        information = "italic",
                },
                underlines = {
                        errors = "underline",
                        hints = "underline",
                        warnings = "underline",
                        information = "underline",
                },
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = false,
            gitgutter = true,
            gitsigns = false,
            telescope = true,
            nvimtree = {
                enabled = false,
                show_root = false,
            },
            which_key = false,
            indent_blankline = {
                enabled = false,
                colored_indent_levels = false,
            },
            dashboard = false,
            neogit = false,
            vim_sneak = false,
            fern = false,
            barbar = false,
            bufferline = false,
            markdown = true,
            lightspeed = true,
            ts_rainbow = false,
            hop = false,
            notify = false,
            telekasten = false,
        }}

    catppuccin.setup(settings)

EOF
