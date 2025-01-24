vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { silent = true })

-- lazy.nvim related mappings
vim.keymap.set('n', '<leader>ul', '<cmd>Lazy<cr>', { desc = 'Lazy UI' })

-- Moves selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection one line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection one line up' })

-- Yank/paste to/from system clipboard
vim.keymap.set({ 'n', 'x' }, [["*y]], [["+y]], { desc = 'Yank selection to system clipboard' })
vim.keymap.set({ 'n', 'x' }, [["*p]], [["+p]], { desc = 'Paste selection from system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>y', [["+y]], { desc = 'Yank selection to system clipboard' })
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

-- Create new line and keep curson position
vim.keymap.set({ 'n', 'v' }, '[<space>', 'O<esc>j')
vim.keymap.set({ 'n', 'v' }, ']<space>', 'o<esc>k')

-- Diagnostic keymaps
vim.keymap.set(
    'n',
    '<leader>e',
    vim.diagnostic.open_float,
    { desc = 'Open floating diagnostic message' }
)
vim.keymap.set('n', '<leader>X', vim.diagnostic.setqflist, { silent = true, desc = 'Diagnostics' })

-- Quickfix
vim.keymap.set('n', '<C-j>', '<cmd>cn<cr>', { silent = true, desc = 'Next Quickfix item' })
vim.keymap.set('n', '<C-k>', '<cmd>cp<cr>', { silent = true, desc = 'Previous Quickfix item' })

-- Colorcolumn
vim.keymap.set('n', '<leader>uc', function()
    local column = vim.o.colorcolumn
    if column == '' then
        vim.o.colorcolumn = '70,100'
    else
        vim.o.colorcolumn = ''
    end
end, { silent = true, desc = 'Colorcolumn (Toggle)' })

-- Terminals
vim.keymap.set('n', '<leader>ct', function()
    vim.cmd.new()
    vim.cmd.wincmd('J')
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
end, { silent = true, desc = 'Split terminal' })
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')
vim.keymap.set('t', '<C-q>', '<c-\\><c-n><cmd>bd!<cr>')
