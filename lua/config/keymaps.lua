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
-- stylua: ignore end

-- Pickers
vim.keymap.del('n', '<leader><space>')
vim.keymap.set('n', '<leader><space>', LazyVim.pick('files', { root = false }), { desc = 'Find Files (cwd)' })
vim.keymap.del('n', '<leader>/')
vim.keymap.set('n', '<leader>/', LazyVim.pick('live_grep', { root = false }), { desc = 'Grep (cwd)' })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })

-- Buffers
vim.keymap.set('n', '<leader>bc', '<cmd>let @+=@%<cr>', { desc = 'Copy path (cwd)' })

-- Tabline
vim.keymap.del('n', '<leader>uA')
