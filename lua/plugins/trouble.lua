return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        {
            '<leader>q',
            function()
                require('trouble').toggle('quickfix')
            end,
            mode = 'n',
            desc = 'Trouble: Quickfix',
        },
        {
            '<leader>x',
            function()
                require('trouble').toggle('document_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Document)',
        },
        {
            '<leader>X',
            function()
                require('trouble').toggle('workspace_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Workspace)',
        },
        {
            '<C-j>',
            function()
                local trouble = require('trouble')

                trouble.open('quickfix')

                trouble.next({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to next item in quickfix list',
        },
        {
            '<C-k>',
            function()
                local trouble = require('trouble')

                trouble.open('quickfix')

                trouble.previous({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to previous item in quickfix list',
        },
        {
            ']d',
            function()
                local trouble = require('trouble')

                trouble.open('workspace_diagnostics')

                trouble.next({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to next item in workspace diagnostics',
        },
        {
            '[d',
            function()
                local trouble = require('trouble')

                trouble.open('workspace_diagnostics')

                trouble.previous({ skip_groups = true, jump = true })
            end,
            mode = 'n',
            desc = 'Trouble: Jump to previous item in workspace diagnostics',
        },
    },
}
