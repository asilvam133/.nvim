return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    event = 'BufEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable('make') == 1
            end,
        },
    },
    opts = function()
        -- trouble is working with everything except with the git_status picker
        return {
            defaults = {
                color_devicons = true,
            },
        }
    end,
    keys = function()
        local builtin = require('telescope.builtin')

        return {
            { '<leader>/', builtin.resume, mode = 'n', desc = 'Resume search' },
            { '<leader>b', builtin.buffers, mode = 'n', desc = 'Buffers' },
            {
                '<leader>h',
                function()
                    builtin.help_tags({ layout_strategy = 'horizontal' })
                end,
                mode = 'n',
                desc = 'Help',
            },
            {
                '<leader>k',
                function()
                    builtin.keymaps({ layout_strategy = 'horizontal' })
                end,
                mode = 'n',
                desc = 'Keymaps',
            },
            { '<leader>m', builtin.marks, mode = 'n', desc = 'Marks' },
            { '<leader>r', builtin.registers, mode = 'n', desc = 'Registers' },
            {
                '<leader>f',
                function()
                    builtin.find_files({ path_display = { 'truncate' } })
                end,
                mode = 'n',
                desc = 'Files',
            },
            {
                '<leader>F',
                function()
                    builtin.find_files({ path_display = { 'truncate' }, hidden = true })
                end,
                mode = 'n',
                desc = 'Files (Hidden)',
            },
            {
                '<leader>s',
                function()
                    builtin.grep_string({ search = vim.fn.input('Grep by: ') })
                end,
                mode = 'n',
                desc = 'Search',
            },
            {
                '<leader>w',
                builtin.grep_string,
                mode = 'n',
                desc = 'Word (Grep)',
            },
            {
                '<leader>W',
                function()
                    local word = vim.fn.expand('<cWORD>')
                    builtin.grep_string({ search = word })
                end,
                mode = 'n',
                desc = 'WORD (Grep)',
            },

            -- git related
            { '<leader>gc', builtin.git_status, mode = 'n', desc = 'Git changes' },
            {
                '<leader>gC',
                function()
                    builtin.git_commits({ layout_strategy = 'horizontal' })
                end,
                mode = 'n',
                desc = 'Git commits',
            },
        }
    end,
}
