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
                '<leader>a',
                function()
                    harpoon:list():add()
                end,
                mode = 'n',
                desc = 'Harpoon: Mark file',
            },
        }

        for k, v in pairs({ '+', '[', '{', '(', '&', '=', ')', '}', ']', '*' }) do
            table.insert(keybinds, {
                '<leader>' .. v,
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
