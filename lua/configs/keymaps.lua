vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { silent = true })

-- lazy.nvim related mappings
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy UI' })

-- Netrw related mappings
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<cr>', { desc = 'Project view' })
vim.keymap.set('n', '<leader>pc', '<cmd>e .<cr>', { desc = 'Project view (cwd)' })

-- Moves selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection one line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection one line up' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set('x', '<leader>Y', [["+Y]], { desc = 'Yank rest of line to system clipboard' })

-- Fix cursorline keybinding
vim.keymap.set('n', 'zv', '<cmd>set cursorline!<cr>', { desc = 'Show cursor line' })

-- Next occurrence, center view and show cursor line
vim.keymap.set('n', 'n', 'nzz<cmd>set cursorline<cr>', { desc = 'Next occurence and center view' })

-- Center when go to end of file
vim.keymap.set('n', 'G', 'Gzz', { desc = 'Go to end of file and center' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)
