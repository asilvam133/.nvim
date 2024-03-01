return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    keys = {
        {
            '<leader>X',
            function()
                require('trouble').toggle('workspace_diagnostics')
            end,
            mode = 'n',
            desc = 'Trouble: Diagnostics (Workspace)',
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
