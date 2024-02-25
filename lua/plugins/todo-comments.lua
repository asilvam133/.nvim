return {
    'folke/todo-comments.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
        { '<leader>t', '<cmd>TodoTelescope<cr>', mode = 'n', desc = 'Todo comments' },
    },
}
