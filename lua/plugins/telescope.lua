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
                    layout_strategy = 'vertical',
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
                {
                    '<leader>pf',
                    function()
                        builtin.find_files()
                    end,
                    mode = 'n',
                    desc = 'Find files',
                },
                {
                    '<leader>ph',
                    function()
                        builtin.find_files({ hidden = true })
                    end,
                    mode = 'n',
                    desc = 'Find files (hidden)',
                },
                { '<C-p>', builtin.git_status, mode = 'n', desc = 'List git changes' },
                { '<leader><space>', builtin.live_grep, mode = 'n', desc = 'Find using grep' },
                { '<leader>/', builtin.resume, mode = 'n', desc = 'Resume search' },
                {
                    '<leader>f/',
                    function()
                        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
                            previewer = false,
                        }))
                    end,
                    mode = 'n',
                    desc = 'Grep current buffer',
                },
                { '<leader>fd', builtin.diagnostics, mode = 'n', desc = 'Find diagnostics' },
                { '<leader>fw', builtin.grep_string, mode = 'n', desc = 'Find word under cursor' },
                {
                    '<leader>fW',
                    function()
                        local word = vim.fn.expand('<cWORD>')
                        builtin.grep_string({ search = word })
                    end,
                    mode = 'n',
                    desc = 'Find WORD under cursor',
                },
                { '<leader>fh', builtin.help_tags, mode = 'n', desc = 'List help tags' },
                { '<leader>fb', builtin.buffers, mode = 'n', desc = 'List buffers' },
                { '<leader>fk', builtin.keymaps, mode = 'n', desc = 'List keymaps' },
            }
        end,
    },
}
