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
                component_separators = '',
                section_separators = '',
                disabled_filetypes = {
                    'fugitive',
                    'statusline',
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'fancy_mode' },
                lualine_b = { 'fancy_branch', 'fancy_diff', 'fancy_diagnostics' },
                lualine_c = {
                    function()
                        local icon, iconhl = get_file_icon()
                        return '%#' .. iconhl .. '#' .. icon .. ' ' .. vim.fn.expand('%') .. '%*'
                    end,
                },
                lualine_x = { 'fancy_macro', 'fancy_location' },
                lualine_y = { 'fancy_filetype' },
                lualine_z = { 'fancy_lsp_servers' },
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
