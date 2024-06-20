return {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        { '-', '<cmd>Oil<cr>', mode = 'n', desc = 'File explorer' },
    },
}
