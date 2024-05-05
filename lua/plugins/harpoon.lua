return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('harpoon'):setup()
    end,
    keys = function()
        local harpoon = require('harpoon')
        return {
            {
                '<C-e>',
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                mode = 'n',
                desc = 'Harpoon: Show marks',
            },
            {
                '<leader>a',
                function()
                    harpoon:list():add()
                end,
                mode = 'n',
                desc = 'Harpoon: Mark file',
            },
            {
                '<C-h>',
                function()
                    harpoon:list():select(1)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 1',
            },
            {
                '<C-t>',
                function()
                    harpoon:list():select(2)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 2',
            },
            {
                '<C-n>',
                function()
                    harpoon:list():select(3)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 3',
            },
            {
                '<C-s>',
                function()
                    harpoon:list():select(4)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 4',
            },
        }
    end,
}
