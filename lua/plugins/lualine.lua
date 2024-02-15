return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'meuter/lualine-so-fancy.nvim',
    },
    opts = function()
        local navic = require('nvim-navic')
        return {
            options = {
                component_separators = { left = '│', right = '│' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    { 'fancy_mode' },
                },
                lualine_b = {
                    { 'fancy_branch' },
                    { 'fancy_diff' },
                },
                lualine_c = {
                    { 'filename' },
                },
                lualine_x = {
                    { 'fancy_macro' },
                    { 'fancy_diagnostics' },
                    { 'fancy_searchcount' },
                    { 'fancy_location' },
                },
                lualine_y = {
                    { 'fancy_filetype', ts_icon = '' },
                },
                lualine_z = {
                    { 'fancy_lsp_servers' },
                },
            },
            winbar = {
                lualine_c = {
                    {
                        function()
                            return navic.get_location()
                        end,
                        cond = function()
                            return navic.is_available()
                        end,
                    },
                },
            },
        }
    end,
}
