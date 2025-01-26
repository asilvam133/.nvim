return {
    'folke/which-key.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        preset = 'helix',
    },
    keys = {
        {
            '<leader>?',
            function()
                require('which-key').show({ global = false })
            end,
            desc = 'Buffer Local Keymaps (which-key)',
        },
    },
    config = function(_, opts)
        local wk = require('which-key')
        wk.setup(opts)
        wk.add({
            { '<leader>c', group = 'Code' },
            { '<leader>d', group = 'Debug' },
            { '<leader>g', group = 'Git' },
            { '<leader>q', group = 'Quickfix' },
            { '<leader>u', group = 'UI' },
        })
    end,
}
