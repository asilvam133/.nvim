return {
    'folke/todo-comments.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
        { '<leader>t', ':TodoQuickFix<cr>', mode = 'n', desc = 'Todo comments (QuickFix list)' },
    },
}
