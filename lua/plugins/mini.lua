return {
    'echasnovski/mini.nvim',
    version = false,
    lazy = false,
    config = function()
        -- text editing
        require('mini.ai').setup()
        require('mini.surround').setup()
        require('mini.splitjoin').setup()

        -- appearance
        require('mini.animate').setup()
    end,
}
