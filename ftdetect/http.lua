vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.http' },
    callback = function()
        vim.opt_local.filetype = 'http'
    end,
})
