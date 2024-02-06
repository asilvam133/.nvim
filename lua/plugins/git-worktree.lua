return {
    'ThePrimeagen/git-worktree.nvim',
    keys = function()
        require('telescope').load_extension('git_worktree')
        local themes = require('telescope.themes')

        return {
            {
                '<leader>ga',
                function()
                    require('telescope').extensions.git_worktree.create_git_worktree(
                        themes.get_dropdown()
                    )
                end,
                mode = 'n',
                desc = 'Git worktree add',
            },
            {
                '<leader>gs',
                function()
                    require('telescope').extensions.git_worktree.git_worktrees(
                        themes.get_dropdown()
                    )
                end,
                mode = 'n',
                desc = 'Git worktree switch (C-d to delete)',
            },
        }
    end,
}
