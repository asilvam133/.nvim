return {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        {
            'sindrets/diffview.nvim',
            keys = {
                {
                    '<leader>gv',
                    function()
                        require('diffview').open({})
                    end,
                    mode = 'n',
                    desc = 'Git diff open',
                },
            },
        },
    },
    config = true,
    keys = function()
        local neogit = require('neogit')
        return {
            { '<leader>go', neogit.open, mode = 'n', desc = 'Open Neogit' },
        }
    end,
}
