local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<leader>cs', function()
    require('telescope').extensions.metals.commands()
end, { silent = true, buffer = bufnr, desc = 'Scala: Commands' })
