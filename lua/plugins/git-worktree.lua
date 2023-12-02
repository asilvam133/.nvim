return {
  {
    'folke/which-key.nvim',
    optional = true,
    opts = {
      defaults = {
        ['<leader>gw'] = { name = '+[W]orktree' },
      },
    },
  },
  {
    'ThePrimeagen/git-worktree.nvim',
    config = function()
      require('telescope').load_extension('git_worktree')
    end,
    keys = {
      {
        '<leader>gw<space>',
        function()
          require('telescope').extensions.git_worktree.git_worktrees()
        end,
        mode = 'n',
        desc = 'Git [W]orktree: Show all',
        silent = true,
      },
      {
        '<leader>gwa',
        function()
          require('telescope').extensions.git_worktree.create_git_worktree()
        end,
        mode = 'n',
        desc = 'Git Worktree: [C]reate tree',
        silent = true,
      },
    },
  },
}
