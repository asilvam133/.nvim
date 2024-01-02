return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        {
            '<leader>q<space>',
            function()
                require('trouble').toggle('quickfix')
            end,
            mode = 'n',
            desc = 'Trouble: Quickfix',
        },
        {
            '<leader>qd',
            function()
                require('trouble').toggle('document_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Document)',
        },
        {
            '<leader>qw',
            function()
                require('trouble').toggle('workspace_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Workspace)',
        },
        {
            ']g',
            function()
                require('trouble').next({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to next item',
        },
        {
            '[g',
            function()
                require('trouble').previous({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to previous item',
        },
    },
}
