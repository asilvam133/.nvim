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
                    { name = 'Kanso', colorscheme = 'kanso-ink' },
                    { name = 'Gruvbox', colorscheme = 'gruvbox' },
                    { name = 'Colorbuddy', colorscheme = 'gruvbuddy' },
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
            },
            highlight_groups = {
                TabLine = { bg = 'none' },
                TabLineSel = { bg = 'none' },
                TabLineFill = { bg = 'none' },
                ZenBg = { bg = 'none' },
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
        },
        config = function(_, opts)
            require('everforest').setup(opts)
        end,
    },
    {
        'webhooked/kanso.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
    {
        'folke/tokyonight.nvim',
        opts = {
            transparent = true,
        },
    },
    {
        'catppuccin/nvim',
        opts = {
            flavour = 'mocha',
            transparent_background = true,
        },
    },
    {
        'ellisonleao/gruvbox.nvim',
        priority = 1000,
        opts = {
            background = 'dark',
            transparent_mode = true,
        },
    },
    {
        'asilvam133/colorbuddy.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme('gruvbuddy')
        end,
    },
}
