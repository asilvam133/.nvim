return {
    'echasnovski/mini.surround',
    event = 'BufEnter',
    config = function()
        require('mini.surround').setup()
    end,
}
