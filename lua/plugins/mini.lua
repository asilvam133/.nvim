return {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    config = function()
        -- text editing
        require('mini.ai').setup({
            custom_textobjects = {
                F = require('mini.ai').gen_spec.treesitter({
                    a = '@function.outer',
                    i = '@function.inner',
                }),
                C = require('mini.ai').gen_spec.treesitter({
                    a = '@class.outer',
                    i = '@class.inner',
                }),
            },
        })
        require('mini.surround').setup()
        require('mini.splitjoin').setup()
    end,
}
