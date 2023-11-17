require('treesitter-context').setup {
  max_lines = 3,
}

vim.keymap.set('n', '<leader>t', require('treesitter-context').toggle, { desc = '[T]reesitter-Context Toggle'})
