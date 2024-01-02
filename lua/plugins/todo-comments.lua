return {
    {
        'folke/todo-comments.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        keys = {
            {
                '<leader>qt',
                '<cmd>TodoQuickFix<cr>',
                mode = 'n',
                desc = 'Trouble: Todo-Comments',
            },
        },
    },
}
