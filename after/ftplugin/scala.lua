local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<leader>cs', function()
    require('telescope').extensions.metals.commands()
end, { silent = true, buffer = bufnr, desc = 'Scala: Commands' })

vim.keymap.set('n', '<leader>cl', function()
    require('metals').new_scala_file()
end, { silent = true, buffer = bufnr, desc = 'New Scala file' })

vim.keymap.set('n', '<leader>cr', function()
    require('metals').restart_metals()
end, { silent = true, buffer = bufnr, desc = 'Restart Metals' })
