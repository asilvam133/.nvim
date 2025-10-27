return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup({
                themes = {
                    { name = 'Rose pine', colorscheme = 'rose-pine' },
                    { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
                    { name = 'Catppuccin Mocha', colorscheme = 'catppuccin-mocha' },
                    { name = 'Everforest', colorscheme = 'everforest' },
                    { name = 'Gruvbox', colorscheme = 'gruvbox' },
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
            palette = {
                main = {
                    foam = '#B1BDBE',
                    pine = '#375A74',
                    gold = '#ffaf87',
                    iris = '#CEA2B1',
                },
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
        end,
    },
    {
        'neanias/everforest-nvim',
        version = false,
        lazy = false,
        priority = 1000,
        opts = {
            background = 'hard',
            transparent_background_level = 2,
            italics = false,
            disable_italic_comments = true,
        },
        config = function(_, opts)
            require('everforest').setup(opts)
        end,
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
        opts = {
            flavour = 'mocha',
            transparent_background = true,
            no_italic = true,
        },
    },
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        opts = {
            background = 'dark',
            transparent_mode = true,
            italic = {
                strings = false,
                comments = false,
                operators = false,
            },
        },
    },
}
