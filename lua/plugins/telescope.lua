return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    lazy = false,
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
        require('telescope').load_extension('git_worktree')

        return {
            { '<leader>/', builtin.resume, mode = 'n', desc = 'Resume search' },
            { '<leader>b', builtin.buffers, mode = 'n', desc = 'Buffers' },
            {
                '<leader>h',
                builtin.help_tags,
                mode = 'n',
                desc = 'Help',
            },
            {
                '<leader>k',
                builtin.keymaps,
                mode = 'n',
                desc = 'Keymaps',
            },
            { '<leader>m', builtin.marks, mode = 'n', desc = 'Marks' },
            { '<leader>r', builtin.registers, mode = 'n', desc = 'Registers' },
            {
                '<leader>f',
                builtin.find_files,
                mode = 'n',
                desc = 'Files',
            },
            {
                '<leader>F',
                function()
                    builtin.find_files({ hidden = true })
                end,
                mode = 'n',
                desc = 'Files (Hidden)',
            },
            {
                '<leader>s',
                builtin.live_grep,
                mode = 'n',
                desc = 'Search (small projects)',
            },
            {
                '<leader>S',
                function()
                    -- in case I'm searching in a very large project
                    builtin.grep_string({ search = vim.fn.input('Grep by: ') })
                end,
                mode = 'n',
                desc = 'Search (large projects)',
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
                    builtin.grep_string({ search = word, path_display = { 'filename_first' } })
                end,
                mode = 'n',
                desc = 'WORD (Grep)',
            },

            -- git related
            { '<leader>gc', builtin.git_status, mode = 'n', desc = 'Git changes' },
            {
                '<leader>gC',
                builtin.git_commits,
                mode = 'n',
                desc = 'Git commits',
            },
        }
    end,
}
