return {
    {
        'folke/todo-comments.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {},
        keys = {
            {
                '<leader>pt',
                '<cmd>TodoTelescope<cr>',
                mode = 'n',
                desc = 'Trouble: Todo-Comments',
            },
        },
    },
}
