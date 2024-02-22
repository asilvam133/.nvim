return {
    {
        'asilvam133/rose-pine.nvim',
        name = 'rose-pine',
        lazy = false,
        opts = {
            styles = {
                bold = false,
                italic = true,
                transparency = true,
            },
            highlight_groups = {
                StatusLine = { fg = '#000000', bg = 'pine' },
                TelescopeTitle = { fg = 'base', bg = 'pine' },
                TelescopePromptTitle = { fg = 'base', bg = 'pine' },
                TelescopePreviewTitle = { fg = 'base', bg = 'pine' },
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
        end,
    },
    --     {
    --         'rebelot/kanagawa.nvim',
    --         lazy = true,
    --         priority = 1000,
    --         opts = {
    --             transparent = true,
    --             overrides = function(colors)
    --                 local theme = colors.theme
    --                 return {
    --                     NormalFloat = { bg = 'none' },
    --                     FloatBorder = { bg = 'none' },
    --                     FloatTitle = { bg = 'none' },
    --                     NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    --                     LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --                     TelescopeTitle = { fg = theme.ui.special, bold = true },
    --                     TelescopePromptNormal = { bg = theme.ui.bg_p1 },
    --                     TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
    --                     TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
    --                     TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
    --                     TelescopePreviewNormal = { bg = theme.ui.bg_dim },
    --                     TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    --                     Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
    --                     PmenuSbar = { bg = theme.ui.bg_m1 },
    --                     PmenuThumb = { bg = theme.ui.bg_p2 },
    --                 }
    --             end,
    --             colors = {
    --                 theme = {
    --                     all = {
    --                         ui = {
    --                             bg_gutter = 'none',
    --                         },
    --                     },
    --                 },
    --             },
    --         },
    --         config = function(_, opts)
    --             require('kanagawa').setup(opts)
    --         end,
    --     },
    --     {
    --         'catppuccin/nvim',
    --         name = 'catppuccin',
    --         lazy = true,
    --         priority = 1000,
    --         opts = {
    --             flavour = 'mocha',
    --             transparent_background = true,
    --             integrations = {
    --                 fidget = true,
    --                 harpoon = true,
    --                 indent_blankline = {
    --                     enabled = true,
    --                     scope_color = 'lavander',
    --                     colored_indent_levels = false,
    --                 },
    --                 neogit = false,
    --                 noice = true,
    --                 native_lsp = {
    --                     enabled = true,
    --                     virtual_text = {
    --                         errors = { 'italic' },
    --                         hints = { 'italic' },
    --                         warnings = { 'italic' },
    --                         information = { 'italic' },
    --                     },
    --                     underlines = {
    --                         errors = { 'underline' },
    --                         hints = { 'underline' },
    --                         warnings = { 'underline' },
    --                         information = { 'underline' },
    --                     },
    --                     inlay_hints = {
    --                         background = true,
    --                     },
    --                 },
    --                 notify = true,
    --                 treesitter_context = true,
    --                 telescope = {
    --                     enabled = true,
    --                     style = 'nvchad',
    --                 },
    --                 lsp_trouble = true,
    --                 which_key = true,
    --             },
    --         },
    --         config = function(_, opts)
    --             require('catppuccin').setup(opts)
    --         end,
    --     },
}
