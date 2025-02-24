local bufnr = vim.api.nvim_get_current_buf()
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.keymap.set(
    'n',
    '<leader>cr',
    '<cmd>LspRestart<cr>',
    { silent = true, buffer = bufnr, desc = 'Go: Restart LSP' }
)
