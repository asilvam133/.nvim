return {
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>go', '<cmd>tab Git<cr>',          mode = 'n', desc = 'Git open' },
            { '<leader>gp', '<cmd>Git pull<cr>',         mode = 'n', desc = 'Git pull' },
            { '<leader>gP', '<cmd>Git push --force<cr>', mode = 'n', desc = 'Git push (force)' },
        },
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
