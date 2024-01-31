return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
        keymaps = {
            ['<C-h>'] = false,
            ['<C-t>'] = false,
            ['<C-s>'] = false,
            ['<C-v>'] = 'actions.select_vsplit',
        },
    },
    keys = {
        {
            '<leader>pv',
            '<cmd>Oil<cr>',
            mode = 'n',
            desc = 'Project view',
        },
    },
}
