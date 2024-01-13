-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white , bg = colors.grey },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.blue } },
    replace = { a = { fg = colors.black, bg = colors.blue } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

require('lualine').setup {
    options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
        refresh = { 
            statusline = 1000,
            tabline = 1000,  
            winbar = 1000
        },
        sections = {
            lualine_a = {{ 'branch', separator = { left = '' }, right_padding = 2 },},
            lualine_b = {
                {
                    'diff',
                    colored = true,
                    diff_color = {
                        added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
                        modified = 'LuaLineDiffChange', -- Changes the diff's modified color
                        removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
                    },
                    symbols = {added = '+', modified = '~', removed = '-'},
                },
            }, 
            lualine_c = {
                { 
                    'diagnostics', 
                    sources = { 'nvim_diagnostic', 'coc' },
                    sections = { 'error', 'warn', 'info', 'hint' },
                    diagnostics_color = {
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                    },
                    symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                    colored = true,           -- Displays diagnostics status in color if set to true.
                    update_in_insert = false, -- Update diagnostics in insert mode.
                    always_visible = false,   -- Show diagnostics even if there are none.
                }
            },
            lualine_x = {},
            lualine_y = { 'filetype', 'progress' },
            lualine_z = {
                { 'location', separator = { right = '' }, left_padding = 2 },
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    }}
