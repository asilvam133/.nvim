---@diagnostic disable: missing-parameter
return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            dependencies = {
                'mfussenegger/nvim-dap',
                'nvim-neotest/nvim-nio',
                {
                    'leoluz/nvim-dap-go',
                    opts = {},
                },
            },
            opts = {},
            config = function(_, opts)
                -- loads icons assignment
                require('utils.dap')

                ---@diagnostic disable-next-line: different-requires
                local dap, dapui = require('dap'), require('dapui')
                dapui.setup(opts)
                dap.listeners.after.event_initialized['dapui_config'] = function()
                    dapui.open()
                end
            end,
            keys = {
                {
                    '<Leader>du',
                    function()
                        require('dapui').toggle()
                    end,
                    mode = 'n',
                    desc = 'DAP: Toogle UI',
                },
                {
                    '<Leader>df',
                    function()
                        require('dapui').float_element()
                    end,
                    mode = 'n',
                    desc = 'DAP: Float element',
                },
                {
                    '<Leader>de',
                    function()
                        require('dapui').eval()
                    end,
                    mode = 'n',
                    desc = 'DAP: Evaluate expression',
                },
            },
        },
        config = function() end,
        keys = {
            {
                '<leader>db',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').toggle_breakpoint()
                end,
                mode = 'n',
                desc = 'DAP: Toggle breakpoint',
            },
            {
                '<leader>dc',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').continue()
                end,
                mode = 'n',
                desc = 'DAP: Continue',
            },
            {
                '<leader>dt',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').terminate()
                end,
                desc = 'DAP: Terminate',
            },
            {
                '<leader>do',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').step_over()
                end,
                mode = 'n',
                desc = 'DAP: Step over',
            },
            {
                '<leader>di',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').step_into()
                end,
                mode = 'n',
                desc = 'DAP: Step into',
            },
            {
                '<leader>dx',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').step_out()
                end,
                mode = 'n',
                desc = 'DAP: Step out',
            },
            {
                '<Leader>dr',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').repl.open()
                end,
                mode = 'n',
                desc = 'DAP: REPL',
            },
            {
                '<Leader>dl',
                function()
                    ---@diagnostic disable-next-line: different-requires
                    require('dap').run_last()
                end,
                mode = 'n',
                desc = 'DAP: Run last',
            },
        },
    },
}
