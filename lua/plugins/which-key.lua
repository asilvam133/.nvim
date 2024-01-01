return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
        plugins = { spelling = true },
        defaults = {
            ['<leader>c'] = { name = 'Code', _ = 'which_key_ignore' },
            ['<leader>f'] = { name = 'Find', _ = 'which_key_ignore' },
            ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
            ['<leader>p'] = { name = 'Project', _ = 'which_key_ignore' },
            ['<leader>q'] = { name = 'Quickfix', _ = 'which_key_ignore' },
            ['<leader>u'] = { name = 'UI', _ = 'which_key_ignore' },
            ['<leader>w'] = { name = 'Workspace', _ = 'which_key_ignore' },
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
