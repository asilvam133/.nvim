return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup({
                themes = {
                    { name = 'Rose pine', colorscheme = 'rose-pine' },
                    { name = 'Tokyonight Night', colorscheme = 'tokyonight-night' },
                    { name = 'Neofusion', colorscheme = 'neofusion' },
                    { name = 'Gruvbox', colorscheme = 'gruvbox' },
                    { name = 'Kanagawa', colorscheme = 'kanagawa-wave' },
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
    {
        'rebelot/kanagawa.nvim',
        opts = {
            theme = 'wave',
            transparent = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        },
                    },
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = 'none' },
                    FloatBorder = { bg = 'none' },
                    FloatTitle = { bg = 'none' },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                }
            end,
        },
    },
    {
        'diegoulloao/neofusion.nvim',
        priority = 1000,
        opts = {
            transparent_mode = true,
            inverse = false,
        },
    },
}
