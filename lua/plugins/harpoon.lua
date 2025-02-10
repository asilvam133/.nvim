return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('harpoon'):setup()
    end,
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
    --         return {
    --             {
    --                 '<C-e>',
    --                 function()
    --                     harpoon.ui:toggle_quick_menu(harpoon:list())
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Show marks',
    --             },
    --             {
    --                 '<leader>a',
    --                 function()
    --                     harpoon:list():add()
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Mark file',
    --             },
    --             {
    --                 '<leader>+',
    --                 function()
    --                     harpoon:list():select(1)
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Go to mark 1',
    --             },
    --             {
    --                 '<leader>[',
    --                 function()
    --                     harpoon:list():select(2)
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Go to mark 2',
    --             },
    --             {
    --                 '<leader>{',
    --                 function()
    --                     harpoon:list():select(3)
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Go to mark 3',
    --             },
    --             {
    --                 '<leader>(',
    --                 function()
    --                     harpoon:list():select(4)
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Go to mark 4',
    --             },
    --             {
    --                 '<leader>&',
    --                 function()
    --                     harpoon:list():select(5)
    --                 end,
    --                 mode = 'n',
    --                 desc = 'Harpoon: Go to mark 5',
    --             },
    --         }
    --     end,
}
