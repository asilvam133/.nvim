return {
    'ThePrimeagen/git-worktree.nvim',
    keys = function()
        require('telescope').load_extension('git_worktree')

        return {
            {
                '<leader>ga',
                require('telescope').extensions.git_worktree.create_git_worktree,
                mode = 'n',
                desc = 'Git create tree',
            },
            {
                '<leader>gg',
                require('telescope').extensions.git_worktree.git_worktrees,
                mode = 'n',
                desc = 'Git switch tree (C-d to delete)',
            },
        }
    end,
}
