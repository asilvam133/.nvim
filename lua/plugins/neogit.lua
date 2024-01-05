-- TODO: Add ThePrimeagen Worktree plugin and add mappings inside the <leader>g group
return {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        {
            'sindrets/diffview.nvim',
            keys = {
                {
                    '<leader>gd',
                    function()
                        require('diffview').open()
                    end,
                    mode = 'n',
                    desc = 'Git diff view',
                },
            },
        },
        'ibhagwan/fzf-lua',
    },
    opts = {},
    keys = {
        {
            '<leader>gs',
            function()
                require('neogit').open()
            end,
            mode = 'n',
            desc = 'Git Open',
        },
        {
            '<leader>gc',
            function()
                require('neogit').open({ 'commit' })
            end,
            mode = 'n',
            desc = 'Git Commit',
        },
    },
}
