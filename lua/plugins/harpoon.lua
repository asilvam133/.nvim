return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('harpoon'):setup()
    end,
    keys = {
        {
            '<C-e>',
            function()
                local harpoon = require('harpoon')
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            mode = 'n',
            desc = 'Harpoon: Show marks',
        },
        {
            '<leader>a',
            function()
                require('harpoon'):list():append()
            end,
            mode = 'n',
            desc = 'Harpoon: Mark file',
        },
        {
            '<C-h>',
            function()
                require('harpoon'):list():select(1)
            end,
            mode = 'n',
            desc = 'Harpoon: Go to mark 1',
        },
        {
            '<C-t>',
            function()
                require('harpoon'):list():select(2)
            end,
            mode = 'n',
            desc = 'Harpoon: Go to mark 2',
        },
        {
            '<C-n>',
            function()
                require('harpoon'):list():select(3)
            end,
            mode = 'n',
            desc = 'Harpoon: Go to mark 3',
        },
        {
            '<C-s>',
            function()
                require('harpoon'):list():select(4)
            end,
            mode = 'n',
            desc = 'Harpoon: Go to mark 4',
        },
    },
}
