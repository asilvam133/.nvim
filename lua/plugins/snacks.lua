return {
    'folke/snacks.nvim',
    opts = {
        explorer = { enabled = false },
    },
    keys = {
        { '<leader>/', false },
        { '<leader>fe', false },
        { '<leader>fE', false },
        { '<leader>E', false },
        { '<leader>e', false },
        { '<leader><space>', LazyVim.pick('files', { root = false }), desc = 'Find Files (cwd)' },
        { '<leader>/', LazyVim.pick('live_grep', { root = false }), desc = 'Grep (cwd)' },
    },
}
