return {
    {
        'tpope/vim-fugitive',
        event = 'BufWinEnter',
        keys = {
            { '<leader>go', '<cmd>Git<cr>', mode = 'n', desc = 'Git open' },
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
