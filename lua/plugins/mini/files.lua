return {
    'echasnovski/mini.files',
    lazy = false,
    opts = {
        windows = {
            preview = true,
            width_focus = 30,
            width_preview = 60,
        },
    },
    keys = {
        {
            '<leader>fc',
            function()
                require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
            end,
            mode = 'n',
            desc = 'File explorer (current dir)',
        },
        {
            '<leader>ff',
            function()
                require('mini.files').open(vim.loop.cwd(), true)
            end,
            mode = 'n',
            desc = 'File explorer (cwd)',
        },
    },
    config = function(_, opts)
        require('mini.files').setup(opts)
    end,
}
