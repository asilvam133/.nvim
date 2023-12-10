return {
    'echasnovski/mini.indentscope',
    event = 'VeryLazy',
    opts = {
        symbol = '|',
        options = { try_as_border = true },
    },
    config = function(_, opts)
        require('mini.indentscope').setup(opts)
    end,
}
