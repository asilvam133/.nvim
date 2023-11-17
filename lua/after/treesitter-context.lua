require('treesitter-context').setup {
  max_lines = 3,
}

vim.keymap.set('n', '<leader>uc', require('treesitter-context').toggle, { desc = 'Toggle Treesitter-[C]ontext '})
