return {
  'folke/twilight.nvim',
  keys = {
    { '<leader>ut', function() require('twilight').toggle() end, mode = 'n', desc = 'Toggle [T]wilight' },
  }
}
