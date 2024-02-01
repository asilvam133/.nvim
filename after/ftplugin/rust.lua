local bufnr = vim.api.nvim_get_current_buf()

--debuggables
vim.keymap.set('n', '<leader>dc', '<Nop>')
vim.keymap.set('n', '<leader>dc', function()
    vim.cmd.RustLsp({
        'debuggables',
    })
end, { silent = true, buffer = bufnr, desc = 'Rust: Debuggables' })
