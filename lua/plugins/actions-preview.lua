return {
    'aznhe21/actions-preview.nvim',
    event = 'BufEnter',
    config = function()
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>ca',
            require('actions-preview').code_actions,
            { desc = 'Code actions' }
        )
    end,
}
