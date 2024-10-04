local sign_define = vim.fn.sign_define

-- stylua: ignore start
sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
-- stylua: ignore end

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
                local dap, dapui = require('dap'), require('dapui')
                dapui.setup(opts)
                dap.listeners.after.event_initialized['dapui_config'] = function()
                    dapui.open()
                end
            end,
            -- stylua: ignore start
            keys = {
                { '<Leader>du', function() require('dapui').toggle() end, mode = 'n', desc = 'DAP: Toogle UI', },
                { '<Leader>df', function() require('dapui').float_element() end, mode = 'n', desc = 'DAP: Float element', },
                { '<Leader>de', function() require('dapui').eval() end, mode = 'n', desc = 'DAP: Evaluate expression', },
            },
        },
        config = function() end,
        -- stylua: ignore start
        keys = {
            { '<leader>db', function() require('dap').toggle_breakpoint() end, mode = 'n', desc = 'DAP: Toggle breakpoint', },
            { '<leader>dc', function() require('dap').continue() end, mode = 'n', desc = 'DAP: Continue', },
            { '<leader>dt', function() require('dap').terminate() end, desc = 'DAP: Terminate', },
            { '<leader>do', function() require('dap').step_over() end, mode = 'n', desc = 'DAP: Step over', },
            { '<leader>di', function() require('dap').step_into() end, mode = 'n', desc = 'DAP: Step into', },
            { '<leader>dx', function() require('dap').step_out() end, mode = 'n', desc = 'DAP: Step out', },
            { '<Leader>dr', function() require('dap').repl.open() end, mode = 'n', desc = 'DAP: REPL', },
            { '<Leader>dl', function() require('dap').run_last() end, mode = 'n', desc = 'DAP: Run last', },
        },
    },
}
