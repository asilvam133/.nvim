return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'meuter/lualine-so-fancy.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    opts = function()
        local webdevicons = require('nvim-web-devicons')
        local function get_file_icon()
            local icon, iconhl = webdevicons.get_icon(
                vim.fn.expand('%:t'),
                vim.fn.expand('%:e'),
                { default = true, color = true }
            )
            return icon or '', iconhl
        end

        return {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = { 'fugitive', 'gitcommit' },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = {
                    function()
                        local icon, iconhl = get_file_icon()
                        return '%#' .. iconhl .. '#' .. icon .. ' ' .. vim.fn.expand('%') .. '%*'
                    end,
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'fancy_macro' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }
    end,
}
