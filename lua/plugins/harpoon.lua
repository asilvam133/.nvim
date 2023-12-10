return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VeryLazy',
    keys = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        return {
            { '<leader>he', ui.toggle_quick_menu, mode = 'n', desc = 'Harpoon: Show marks' },
            { '<leader>h<space>', mark.add_file, mode = 'n', desc = 'Harpoon: Mark file' },
            {
                '<C-h>',
                function()
                    ui.nav_file(1)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 1',
            },
            {
                '<C-t>',
                function()
                    ui.nav_file(2)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 2',
            },
            {
                '<C-n>',
                function()
                    ui.nav_file(3)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 3',
            },
            {
                '<C-s>',
                function()
                    ui.nav_file(4)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark 4',
            },
        }
    end,
}
