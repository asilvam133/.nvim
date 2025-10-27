return {
    'folke/snacks.nvim',
    opts = {
        notifier = { enabled = false },
        scroll = { enabled = false },
        explorer = { enabled = false },
        picker = {
            formatters = {
                file = {
                    filename_first = true, -- This option puts the filename at the beginning
                    truncate = 100,
                },
            },
        },
        zen = {
            toggles = {
                dim = false,
            },
        },
    },
    keys = {
        -- I want to disable all keymaps related to the Snacks explorer
        { '<leader>/', false },
        { '<leader>fe', false },
        { '<leader>fE', false },
        { '<leader>e', false },
        { '<leader>E', false },
        -- Focus on current working directory
        { '<leader><space>', LazyVim.pick('files', { root = false }), desc = 'Find Files (cwd)' },
        { '<leader>/', LazyVim.pick('live_grep', { root = false }), desc = 'Grep (cwd)' },
    },
}
