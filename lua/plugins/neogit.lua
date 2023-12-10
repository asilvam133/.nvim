return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim', -- required
        'nvim-telescope/telescope.nvim', -- optional
        'sindrets/diffview.nvim', -- optional
        'ibhagwan/fzf-lua', -- optional
    },
    opts = {},
    keys = {
        {
            '<leader>g<space>',
            function()
                require('neogit').open()
            end,
            mode = 'n',
            desc = 'Git Open',
        },
        {
            '<leader>gc',
            function()
                require('neogit').open({ 'commit' })
            end,
            mode = 'n',
            desc = 'Git Commit',
        },
        {
            '<leader>gs',
            function()
                require('neogit').open({ kind = 'split' })
            end,
            mode = 'n',
            desc = 'Git Open (Split)',
        },
    },
}
