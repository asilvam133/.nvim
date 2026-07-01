return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup({
                themes = {
                    { name = 'Rose pine', colorscheme = 'rose-pine-main' },
                    { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
                    { name = 'Catppuccin', colorscheme = 'catppuccin-mocha' },
                    { name = 'Nightfox', colorscheme = 'nightfox' },
                    { name = 'Duskfox', colorscheme = 'duskfox' },
                    { name = 'Nordfox', colorscheme = 'nordfox' },
                    { name = 'Carbonfox', colorscheme = 'carbonfox' },
                    { name = 'Terafox', colorscheme = 'terafox' },
                    { name = 'Rose pine (Light)', colorscheme = 'rose-pine-dawn' },
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
            no_italic = true,
        },
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            options = {
                transparent = true,
            },
        },
    },
}
