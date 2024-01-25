return {
    'hrsh7th/nvim-cmp',
    version = false,
    event = 'InsertEnter',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        {
            'L3MON4D3/LuaSnip',
            dependencies = 'rafamadriz/friendly-snippets',
            opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
        },
        'onsails/lspkind.nvim',
    },
    opts = function()
        ---@diagnostic disable-next-line: different-requires
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local defaults = require('cmp.config.default')()
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup({})

        local utils = require('utils').cmp

        local border = utils.border
        return {
            completion = {
                completeopt = 'menu,menuone,noinsert',
            },
            window = {
                documentation = {
                    border = border('CmpDocBorder'),
                    winhighlight = 'Normal:CmpDoc',
                },
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            formatting = {
                format = require('lspkind').cmp_format({
                    with_text = true,
                }),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-u>'] = cmp.mapping.scroll_docs(4),
                ['<C-s>'] = cmp.mapping.complete(),
                ['<enter>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'neorg' },
            }, {
                { name = 'buffer' },
            }),
            experimental = {
                ghost_text = {
                    hl_group = 'CmpGhostText',
                },
            },
            sorting = defaults.sorting,
        }
    end,
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end
        ---@diagnostic disable-next-line: different-requires
        require('cmp').setup(opts)
    end,
}
