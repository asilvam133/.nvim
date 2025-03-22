return {
    {
        'zaldih/themery.nvim',
        lazy = false,
        config = function()
            require('themery').setup({
                themes = {
                    { name = 'Rose pine', colorscheme = 'rose-pine' },
                    { name = 'Tokyonight-night', colorscheme = 'tokyonight-night' },
                    { name = 'Everforest', colorscheme = 'everforest' },
                    { name = 'Catppuccin Mocha', colorscheme = 'catppuccin-mocha' },
                    { name = 'Kanagawa Dragon', colorscheme = 'kanagawa-dragon' },
                    { name = 'Kanagawa Wave', colorscheme = 'kanagawa-wave' },
                    { name = 'Neofusion', colorscheme = 'neofusion' },
                    { name = 'Github Dimmed', colorscheme = 'github_dark_dimmed' },
                },
                livePreview = true,
                makePersist = true,
            })
        end,
        keys = {
            { '<space>ut', '<cmd>Themery<cr>', mode = 'n', desc = 'Colorschemes' },
        },
    },
    {
        'asilvam133/rose-pine.nvim',
        name = 'rose-pine',
        lazy = false,
        opts = {
            styles = {
                bold = true,
                italic = false,
                transparency = true,
            },
            highlight_groups = {
                ['@function.builtin.lua'] = { italic = false },
                ['@lsp.type.comment'] = { italic = true },
                ['@lsp.typemod.function.defaultLibrary.lua'] = { italic = false },
                Comment = { italic = true },
                DiagnosticUnnecessary = { italic = false },
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
        'rebelot/kanagawa.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            keywordStyle = { italic = false },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = 'none' },
                    CursorLine = { bg = '#26233a' },
                    ColorColumn = { bg = 'none' },
                    FloatBorder = { bg = 'none' },
                    FloatTitle = { bg = 'none' },
                    NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
                    TabLine = { bg = 'none' },
                    TabLineFill = { bg = 'none' },
                    LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },
                    ZenBg = { bg = 'none' },
                }
            end,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none',
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            require('kanagawa').setup(opts)
        end,
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        opts = {
            flavour = 'mocha',
            transparent_background = true,
            integrations = {
                fidget = true,
                harpoon = true,
                noice = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { 'italic' },
                        hints = { 'italic' },
                        warnings = { 'italic' },
                        information = { 'italic' },
                    },
                    underlines = {
                        errors = { 'underline' },
                        hints = { 'underline' },
                        warnings = { 'underline' },
                        information = { 'underline' },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                notify = true,
                treesitter_context = true,
                telescope = {
                    enabled = true,
                    style = 'nvchad',
                },
                lsp_trouble = true,
            },
            custom_highlights = function(_)
                return {
                    ['@module'] = { style = {} },
                    Conditional = { style = {} },
                    TabLine = { bg = 'none' },
                    TabLineSel = { bg = 'none' },
                    TabLineFill = { bg = 'none' },
                    ZenBg = { bg = 'none' },
                }
            end,
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
        end,
    },
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
            styles = {
                keywords = { italic = false },
            },
        },
    },
    {
        'diegoulloao/neofusion.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            transparent_mode = true,
            overrides = {
                LineNr = { fg = '#fd5e3a' },
                LineNrAbove = { fg = '#08435e' },
                LineNrBelow = { fg = '#08435e' },
                ZenBg = { bg = 'none' },
            },
        },
        config = function(_, opts)
            require('neofusion').setup(opts)
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme',
        lazy = false,
        priority = 1000,
        opts = {
            options = {
                transparent = true,
            },
        },
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
}
