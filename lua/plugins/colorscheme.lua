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
                    { name = 'Neofusion', colorscheme = 'neofusion' },
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
            on_highlights = function(hl, c)
                local prompt = '#2d3149'
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
            end,
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
