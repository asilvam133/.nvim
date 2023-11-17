require('treesitter-context').setup {
  max_lines = 3,
}

-- Enable context by default
require('treesitter-context').enable()

vim.keymap.set('n', '<leader>uc', require('treesitter-context').toggle, { desc = 'Toggle Treesitter-[C]ontext '})
