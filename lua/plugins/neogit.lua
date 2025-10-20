return {
    'NeogitOrg/neogit',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/snacks.nvim',
    },
    keys = {
        { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Git' },
    },
}
