local bufnr = vim.api.nvim_get_current_buf()
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.keymap.set('n', '<leader>cs', function()
    require('telescope').extensions.metals.commands()
end, { silent = true, buffer = bufnr, desc = 'Scala: Commands' })
vim.keymap.set('n', '<leader>cn', function()
    vim.cmd(':MetalsNewScalaFile')
end, { silent = true, buffer = bufnr, desc = 'Scala: New Scala File' })
vim.keymap.set('n', '<leader>cr', function()
    vim.cmd(':MetalsRestartMetals')
end, { silent = true, buffer = bufnr, desc = 'Scala: Restart LSP' })
