return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
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
            local actions = require('telescope.actions')

            return {
                defaults = {
                    color_devicons = true,
                    layout_strategy = 'vertical',
                    layout_config = {
                        prompt_position = 'top',
                        vertical = {
                            mirror = true,
                        },
                    },
                    mappings = {
                        i = {
                            ['<C-q>'] = actions.send_to_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist,
                        },
                        n = {
                            ['<C-q>'] = actions.send_to_qflist,
                            ['<M-q>'] = actions.send_selected_to_qflist,
                        },
                    },
                },
            }
        end,
        keys = function()
            local builtin = require('telescope.builtin')

            return {
                { '<leader>/', builtin.resume, mode = 'n', desc = 'Resume search' },
                { '<C-p>', builtin.git_status, mode = 'n', desc = 'Git changes' },
                { '<leader>vb', builtin.buffers, mode = 'n', desc = 'View buffers' },
                { '<leader>vh', builtin.help_tags, mode = 'n', desc = 'View help tags' },
                { '<leader>vk', builtin.keymaps, mode = 'n', desc = 'View keymaps' },
                { '<leader>vm', builtin.marks, mode = 'n', desc = 'View marks' },
                { '<leader>vr', builtin.registers, mode = 'n', desc = 'View registers' },
                {
                    '<leader>pw',
                    builtin.grep_string,
                    mode = 'n',
                    desc = 'Project search word under cursor',
                },
                {
                    '<leader>pW',
                    function()
                        local word = vim.fn.expand('<cWORD>')
                        builtin.grep_string({ search = word })
                    end,
                    mode = 'n',
                    desc = 'Project search WORD under cursor',
                },
                {
                    '<leader>pf',
                    function()
                        builtin.find_files({ path_display = { 'truncate' } })
                    end,
                    mode = 'n',
                    desc = 'Project files',
                },
                {
                    '<leader>ps',
                    function()
                        builtin.grep_string({ search = vim.fn.input('Restrict by = ') })
                    end,
                    mode = 'n',
                    desc = 'Project search',
                },
            }
        end,
    },
}
