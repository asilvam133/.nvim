return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        {
            '<leader>x<space>',
            function()
                require('trouble').toggle()
            end,
            mode = 'n',
            desc = 'Trouble: Toggle',
        },
        {
            '<leader>xq',
            function()
                require('trouble').open('quickfix')
            end,
            mode = 'n',
            desc = 'Trouble: Quickfix',
        },
        {
            '<leader>xd',
            function()
                require('trouble').open('document_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Document)',
        },
        {
            '<leader>xD',
            function()
                require('trouble').open('workspace_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Workspace)',
        },
        {
            '<leader>xn',
            function()
                require('trouble').next({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to next item',
        },
        {
            '<leader>xp',
            function()
                require('trouble').previous({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to previous item',
        },
    },
}
