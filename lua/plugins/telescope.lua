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
        keys = function()
            local builtin = require('telescope.builtin')

            return {
                {
                    '<leader>/',
                    function()
                        builtin.find_files()
                    end,
                    mode = 'n',
                    desc = 'Find files',
                },
                {
                    '<leader>-',
                    function()
                        builtin.find_files({ hidden = true })
                    end,
                    mode = 'n',
                    desc = 'Find files --hidden',
                },
                { '<leader><space>', builtin.live_grep, mode = 'n', desc = 'Find using grep' },
                { '<leader>f<space>', builtin.resume, mode = 'n', desc = 'Resume search' },
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
                { '<leader>fs', builtin.grep_string, mode = 'n', desc = 'Grep under cursor' },
                { '<leader>fh', builtin.help_tags, mode = 'n', desc = 'List help tags' },
                { '<leader>fb', builtin.buffers, mode = 'n', desc = 'List buffers' },
                { '<leader>gg', builtin.git_status, mode = 'n', desc = 'List git changes' },
                { '<leader>uc', builtin.colorscheme, mode = 'n', desc = 'Colorschemes' },
            }
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        keys = {
            {
                '<leader>ff',
                ':Telescope file_browser<CR>',
                desc = 'File browser (cwd)',
                noremap = true,
                silent = true,
            },
            {
                '<leader>fc',
                ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
                desc = 'File browser (buffer path)',
                noremap = true,
                silent = true,
            },
        },
    },
}
