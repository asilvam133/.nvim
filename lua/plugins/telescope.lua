return {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
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
                path_display = {
                    filename_first = {
                        reverse_directories = false,
                    },
                },
                file_ignore_patterns = {
                    -- scala
                    'project',
                    'target',
                    -- end scala
                },
            },
        }
    end,
    keys = function()
        local builtin = require('telescope.builtin')
        local themes = require('telescope.themes')
        local theme = themes.get_dropdown({ previewer = false })

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
                function()
                    builtin.find_files(theme)
                end,
                mode = 'n',
                desc = 'Files',
            },
            {
                '<leader>F',
                function()
                    local hidden_files_theme =
                        themes.get_dropdown({ previewer = false, hidden = true })
                    builtin.find_files(hidden_files_theme)
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
                builtin.current_buffer_fuzzy_find,
                mode = 'n',
                desc = 'Search current buffer',
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
