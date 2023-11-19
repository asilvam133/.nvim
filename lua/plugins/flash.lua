return {
  'folke/flash.nvim',
  vscode = true,
  opts = {},
  keys = {
    { 's',     function() require('flash').jump() end,              mode = { 'n', 'x', 'o' }, desc = 'Flash' },
    { 'S',     function() require('flash').treesitter() end,        mode = { 'n', 'x', 'o' }, desc = 'Flash Treesitter' },
    { 'r',     function() require('flash').remote() end,            mode = 'o',               desc = 'Remote Flash' },
    { 'R',     function() require('flash').treesitter_search() end, mode = { 'x', 'o' },      desc = 'Treesitter Search' },
    { '<C-s>', function() require('flash').jump() end,              mode = { 'c' },           desc = 'Toggle Flash Search' },
  }
}
