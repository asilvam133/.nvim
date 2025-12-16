return {
    'nvim-mini/mini.files',
    keys = {
        { '<leader>fm', false },
        {
            '<leader>C',
            function()
                require('mini.files').open(vim.uv.cwd(), true)
            end,
            desc = 'Open mini.files (cwd)',
        },
        {
            '-',
            function()
                local buf_name = vim.api.nvim_buf_get_name(0)
                local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                MiniFiles.open(path)
                MiniFiles.reveal_cwd()
            end,
            desc = 'Open mini.files (current buffer)',
        },
    },
}
