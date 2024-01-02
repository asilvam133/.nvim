return {
    {
        'folke/todo-comments.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        keys = {
            {
                '<leader>ft',
                '<cmd>TodoQuickFix<cr>',
                mode = 'n',
                desc = 'Find Todo-Comments',
            },
        },
    },
}
