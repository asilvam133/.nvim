return {
    'ThePrimeagen/git-worktree.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        {
            '<leader>ga',
            function()
                require('telescope').extensions.git_worktree.create_git_worktree()
            end,
            mode = 'n',
            desc = 'Add/Create worktree',
        },
        {
            '<leader>gs',
            function()
                require('telescope').extensions.git_worktree.git_worktrees({
                    path_display = { 'shorten' },
                })
            end,
            mode = 'n',
            desc = 'Switch worktree',
        },
    },
}
