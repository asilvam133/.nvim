return {
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
            { '<leader>/', builtin.find_files, mode = 'n', desc = 'Find files' },
            { '<leader><space>', builtin.live_grep, mode = 'n', desc = 'Find using grep' },
            { '<leader>fd', builtin.diagnostics, mode = 'n', desc = 'Find diagnostics' },
            { '<leader>fr', builtin.resume, mode = 'n', desc = 'Resume search' },
            { '<leader>fs', builtin.resume, mode = 'n', desc = 'Grep under cursor' },
            { '<leader>gg', builtin.git_status, mode = 'n', desc = 'Git: List current changes' },
        }
    end,
}
