-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-f>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { silent = true })
vim.keymap.set('n', '<leader>v', '<cmd>Ex<cr>', { desc = 'Project [V]iew' })
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy UI' })

-- Moves selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selection one line down' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selection one line up' })

-- Scroll and center view
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center view' })

-- Paste on selection and keep register
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste and keep register' })

-- Paste from system clipboard
vim.keymap.set('n', '<C-p>', [["+P]], { desc = 'Paste from system clipboard' })
vim.keymap.set('x', '<C-p>', [["_d"+P]], { desc = 'Paste from system clipboard' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set('x', '<leader>Y', [["+Y]], { desc = 'Yank rest of line to system clipboard' })

-- Fix cursorline keybinding
vim.keymap.set('n', 'zv', '<cmd>set cursorline!<cr>', { desc = 'Show cursor line' })

-- Next occurrence, center view and show cursor line
vim.keymap.set('c', '<cr>', function() return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<cr>' end, { expr = true })
vim.keymap.set('n', 'n', 'nzz<cmd>set cursorline<cr>', { desc = 'Next occurence and center view' })
vim.keymap.set('n', '*', '*zz', { desc = 'Fast search word and center view' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
