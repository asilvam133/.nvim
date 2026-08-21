return {
    'ThePrimeagen/harpoon',
    keys = function()
        local harpoon = require('harpoon')

        local keybinds = {
            {
                '<C-e>',
                function()
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                mode = 'n',
                desc = 'Harpoon: Show marks',
            },
            {
                '<leader>n',
                function()
                    harpoon:list():add()
                end,
                mode = 'n',
                desc = 'Harpoon: Mark file',
            },
        }

        for k = 1, 9 do
            table.insert(keybinds, {
                '<leader>' .. k,
                function()
                    harpoon:list():select(k)
                end,
                mode = 'n',
                desc = 'Harpoon: Go to mark ' .. k,
            })
        end

        return keybinds
    end,
}
