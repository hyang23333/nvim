return {
    -- "santos-gabriel-dario/darcula-solid.nvim",
    "doums/darcula",
    lazy = false,
    config = function()
        local c = require('vscode.colors').get_colors()
        require('vscode').setup({
            -- transparent = true,
            italic_comments = true,
            underline_links = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                vscLineNumber = '#FFFFFF',
            },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
            }
        })
        require('vscode').load()
    end,
}
