return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {},
    keys = {
        {
            '<leader>pv',
            '<cmd>Oil<cr>',
            mode = 'n',
            desc = 'Project view',
        },
    },
}
