return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup({
                themes = {
                    { name = 'Rose pine', colorscheme = 'rose-pine' },
                    { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
                    { name = 'Catppuccin', colorscheme = 'catppuccin-mocha' },
                },
                livePreview = true,
                makePersist = true,
                initial_theme = 'Rose pine',
            })
        end,
        keys = {
            { '<space>ut', '<cmd>Themery<cr>', mode = 'n', desc = 'Colorschemes' },
        },
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        opts = {
            styles = {
                transparency = true,
                italic = false,
            },
            highlight_groups = {
                FloatBorder = { fg = 'foam' },
            },
            palette = {
                main = {
                    foam = '#B1BDBE',
                    pine = '#375A74',
                    gold = '#ffaf87',
                    iris = '#CEA2B1',
                },
            },
        },
    },
    {
        'folke/tokyonight.nvim',
        opts = {
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
                sidebars = 'dark',
                floats = 'dark',
            },
        },
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        opts = {
            transparent_background = true,
        },
    },
}
