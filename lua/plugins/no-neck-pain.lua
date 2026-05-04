return {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    opts = {
        width = 130,
        buffers = {
            right = {
                enabled = false,
            },
        },
    },
    keys = {
        { '<leader>U', '<cmd>NoNeckPain<cr>', desc = 'Toggle no-neck-pain' },
    },
}
