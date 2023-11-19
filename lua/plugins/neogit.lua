return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  opts = {},
  keys = {
    { '<leader>go', function() require('neogit').open() end, mode = 'n', desc = '[G]it [O]pen' },
    { '<leader>gc', function() require('neogit').open({ 'commit' }) end, mode = 'n', desc = '[G]it [C]ommit' },
    { '<leader>gs', function() require('neogit').open({ kind = 'split' }) end, mode = 'n', desc = '[G]it Split View' },
  },
}
