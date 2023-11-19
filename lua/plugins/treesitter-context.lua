return {
  "nvim-treesitter/nvim-treesitter-context",
  enabled = true,
  opts = {
    max_lines = 3,
  },
  keys = {
    { '<leader>uc', function() require('treesitter-context').toggle() end, mode = 'n', desc = 'Toggle Treesitter-[C]ontext ' },
  }
}
