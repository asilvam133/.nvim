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
            '<leader>ss',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump()
            end,
            desc = 'Flash search',
        },
        {
            '<leader>sS',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').treesitter()
            end,
            desc = 'Flash select TS node',
        },
        {
            '<leader>sr',
            mode = 'o',
            function()
                require('flash').remote()
            end,
            desc = 'lash command remote (pending mode)',
        },
        {
            '<leader>sR',
            mode = { 'o', 'x' },
            function()
                require('flash').treesitter_search()
            end,
            desc = 'Flash TS search & select',
        },
    },
}
