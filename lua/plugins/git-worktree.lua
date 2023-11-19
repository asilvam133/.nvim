return {
  'ThePrimeagen/git-worktree.nvim',
  config = function()
    require('telescope').load_extension('git_worktree')
  end,
  keys = {
    { '<leader>gw', function() require('telescope').extensions.git_worktree.git_worktrees() end,       mode = 'n', desc = '[G]it [W]orktrees',    silent = true, },
    { '<leader>ga', function() require('telescope').extensions.git_worktree.create_git_worktree() end, mode = 'n', desc = '[G]it [A]dd Worktree', silent = true, },
  }
}
