-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Yank/paste to/from system clipboard
-- stylua: ignore start
vim.keymap.set({ 'n', 'x' }, [["*y]], [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set({ 'n', 'x' }, [["*p]], [["+p]], { desc = 'Paste selection from system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>y', [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>Y', [["+Y]], { desc = 'Yank everything forward to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', [["+p]], { desc = 'Paste selection from system clipboard (append)' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', [["+P]], { desc = 'Paste selection from system clipboard (prepend)' })
-- stylua: ignore end

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Buffers
vim.keymap.set('n', '<leader>bc', '<cmd>let @+=@%<cr>', { desc = 'Copy path (cwd)' })
