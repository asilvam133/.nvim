vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-f>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { silent = true })
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = '[L]azy UI' })

-- Moves selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection one line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection one line up' })

-- Scroll and center view
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center view' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center view' })

-- Paste from system clipboard
vim.keymap.set('n', '<C-p>', [["+P]], { desc = 'Paste from system clipboard' })
vim.keymap.set('x', '<C-p>', [["_d"+P]], { desc = 'Paste from system clipboard' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set('x', '<leader>Y', [["+Y]], { desc = 'Yank rest of line to system clipboard' })

-- Fix cursorline keybinding
vim.keymap.set('n', 'zv', '<cmd>set cursorline!<cr>', { desc = 'Show cursor line' })

-- Next occurrence, center view and show cursor line
vim.keymap.set('c', '<cr>', function()
    return vim.fn.getcmdtype() == '/' and '<CR>zzzv' or '<cr>'
end, { expr = true })
vim.keymap.set('n', 'n', 'nzz<cmd>set cursorline<cr>', { desc = 'Next occurence and center view' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)

-- [[ Quicklist Keymaps ]]
vim.keymap.set('n', '<leader>qx', '<cmd>call setqflist([])<cr>', { desc = 'Quicklist: Clear' })
vim.keymap.set('n', '<leader>q<space>', '<cmd>copen<cr>', { desc = 'Quicklist: Open' })
vim.keymap.set('n', '<leader>qc', '<cmd>cclose<cr>', { desc = 'Quicklist: Close' })
vim.keymap.set('n', '<leader>qn', '<cmd>cnext<cr>', { desc = 'Quicklist: Next entry' })
vim.keymap.set('n', '<leader>qp', '<cmd>cprev<cr>', { desc = 'Quicklist: Previous entry' })
