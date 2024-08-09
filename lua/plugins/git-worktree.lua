return {
    'ThePrimeagen/git-worktree.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
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
