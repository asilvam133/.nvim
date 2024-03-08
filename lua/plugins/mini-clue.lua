return {
    'echasnovski/mini.clue',
    event = 'VeryLazy',
    opts = function()
        local miniclue = require('mini.clue')
        return {
            window = {
                delay = 400,
            },
            triggers = {
                -- Leader triggers
                { mode = 'n', keys = '<leader>' },
                { mode = 'x', keys = '<leader>' },

                -- Built-in completion
                { mode = 'i', keys = '<C-x>' },

                -- `g` key
                { mode = 'n', keys = 'g' },
                { mode = 'x', keys = 'g' },

                -- Marks
                { mode = 'n', keys = "'" },
                { mode = 'n', keys = '`' },
                { mode = 'x', keys = "'" },
                { mode = 'x', keys = '`' },

                -- Registers
                { mode = 'n', keys = '"' },
                { mode = 'x', keys = '"' },
                { mode = 'i', keys = '<C-r>' },
                { mode = 'c', keys = '<C-r>' },

                -- Window commands
                { mode = 'n', keys = '<C-w>' },

                -- `z` key
                { mode = 'n', keys = 'z' },
                { mode = 'x', keys = 'z' },
            },

            clues = {
                -- Enhance this by adding descriptions for <Leader> mapping groups
                miniclue.gen_clues.builtin_completion(),
                miniclue.gen_clues.g(),
                miniclue.gen_clues.marks(),
                miniclue.gen_clues.registers(),
                miniclue.gen_clues.windows(),
                miniclue.gen_clues.z(),

                { mode = 'n', keys = '<leader>c', desc = 'Code' },
                { mode = 'n', keys = '<leader>d', desc = 'DAP' },
                { mode = 'n', keys = '<leader>g', desc = 'Git' },
            },
        }
    end,
    config = function(_, opts)
        require('mini.clue').setup(opts)
    end,
}
