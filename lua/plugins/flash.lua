return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
        search = {
            mode = 'search',
        },
    },
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash search',
        },
        {
            'S',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash select TS node',
        },
        {
            'r',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'lash command remote (pending mode)',
        },
        {
            'R',
            mode = { 'o', 'x' },
            function()
                require('flash').treesitter_search()
            end,
            desc = 'Flash TS search & select',
        },
    },
}
