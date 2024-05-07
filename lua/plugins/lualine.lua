return {
    -- configuration taken from: https://github.com/adibhanna/nvim/blob/main/lua/plugins/lualine.lua
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
                -- theme = "catppuccin",
                globalstatus = true,
                icons_enabled = true,
                -- component_separators = { left = "│", right = "│" },
                component_separators = { left = '|', right = '|' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {
                        'alfa-nvim',
                        'help',
                        'neo-tree',
                        'Trouble',
                        'spectre_panel',
                        'toggleterm',
                    },
                    winbar = {},
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {
                    'fancy_branch',
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1, -- 2 for full path
                        symbols = {
                            modified = '  ',
                            readonly = '  ',
                            unnamed = '  ',
                        },
                    },
                    {
                        'fancy_diagnostics',
                        sources = { 'nvim_lsp' },
                        symbols = { error = ' ', warn = ' ', info = ' ' },
                    },
                    { 'fancy_searchcount' },
                },
                lualine_x = {
                    'fancy_lsp_servers',
                    'fancy_diff',
                    'progress',
                },
                lualine_y = {},
                lualine_z = {},
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
            extensions = { 'lazy' },
        })
    end,
}
