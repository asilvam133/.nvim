return {
    {
        'tpope/vim-fugitive',
        event = 'BufWinEnter',
        keys = {
            { '<leader>go', '<cmd>Git<cr>', mode = 'n', desc = 'Git open' },
            { '<leader>gp', '<cmd>Git pull<cr>', mode = 'n', desc = 'Git pull' },
            { '<leader>gP', '<cmd>Git push<cr>', mode = 'n', desc = 'Git push' },
        }
    },
    {
        'sindrets/diffview.nvim',
        keys = {
            {
                '<leader>gd',
                function()
                    require('diffview').open()
                end,
                mode = 'n',
                desc = 'Git diff view',
            },
        },
    },
}
