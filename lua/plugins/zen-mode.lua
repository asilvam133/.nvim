return {
    'folke/zen-mode.nvim',
    lazy = false,
    opts = {
        window = {
            width = 150,
        },
    },
    keys = {
        { '<leader>uz', ':ZenMode<cr>', mode = 'n', desc = 'Toggle Zen Mode' },
    },
}
