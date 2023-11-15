require('git-worktree').setup()
require('telescope').load_extension('git_worktree')

-- keymaps
vim.keymap.set('n', '<leader>gw', require('telescope').extensions.git_worktree.git_worktrees, { desc = '[G]it [W]orktrees', silent = true, })
vim.keymap.set('n', '<leader>gc', require('telescope').extensions.git_worktree.create_git_worktree, { desc = '[G]it [C]reate Worktree', silent = true, })
