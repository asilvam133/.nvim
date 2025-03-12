return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'meuter/lualine-so-fancy.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    vent = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'auto',
                globalstatus = true,
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {
                        'help',
                        'Trouble',
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {
                    { 'location', padding = { left = 1, right = 6 } },
                },
                lualine_b = {},
                lualine_c = {
                    {
                        'filetype',
                        icon_only = true,
                        padding = { left = 2, right = 0 },
                        color = '_lualine_c_filetype',
                    },
                    {
                        'filename',
                        path = 1, -- 2 for full path
                        symbols = {
                            unnamed = '',
                            readonly = '',
                            modified = '',
                        },
                    },
                },
                lualine_x = {
                    { 'fancy_macro' },
                    {
                        'fancy_diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = { error = ' ', warn = ' ', info = ' ' },
                        padding = { left = 2, right = 2 },
                    },
                    {
                        'diff',
                        colored = true,
                        padding = { left = 2, right = 2 },
                    },
                },
                lualine_y = {},
                lualine_z = {
                    { 'fancy_lsp_servers', padding = { left = 3 } },
                    { 'progress', padding = { left = 3, right = 3 } },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'lazy', 'mason', 'quickfix' },
        })
    end,
}
