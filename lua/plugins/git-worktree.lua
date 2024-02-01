return {
    'ThePrimeagen/git-worktree.nvim',
    keys = function()
        require('telescope').load_extension('git_worktree')

        return {
            {
                '<leader>gwa',
                require('telescope').extensions.git_worktree.create_git_worktree,
                mode = 'n',
                desc = 'Git worktree add',
            },
            {
                '<leader>gws',
                require('telescope').extensions.git_worktree.git_worktrees,
                mode = 'n',
                desc = 'Git worktree switch (C-d to delete)',
            },
        }
    end,
}
