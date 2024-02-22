return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
        { '<leader>t', '<cmd>TodoTelescope<cr>', mode = 'n', desc = 'Todo comments' },
    },
}
