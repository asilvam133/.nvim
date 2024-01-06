local bufnr = vim.api.nvim_get_current_buf()

--debuggables
vim.keymap.set('n', '<leader>d<space>', '<Nop>')
vim.keymap.set('n', '<leader>d<space>', function()
    vim.cmd.RustLsp({
        'debuggables',
        'last' --[[ optional ]],
    })
end, { silent = true, buffer = bufnr, desc = 'Rust: Debuggables' })
