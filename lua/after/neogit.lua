local neogit = require('neogit')

vim.keymap.set('n', '<leader>go', neogit.open, { desc = '[G]it [O]pen' })
vim.keymap.set('n', '<leader>gc', function() neogit.open({ 'commit' }) end, { desc = '[G]it [C]ommit' })
vim.keymap.set('n', '<leader>gs', function() neogit.open({ kind = 'split' }) end, { desc = '[G]it Split View' })
