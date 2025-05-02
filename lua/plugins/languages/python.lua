return {
    'mfussenegger/nvim-dap-python',
  -- stylua: ignore
  keys = {
    { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
    { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  },
    config = function(_, opts)
        pcall(require, 'mason') -- make sure Mason is loaded. Will fail when generating docs
        local pkg = 'debugpy'
        local path = '/venv/bin/python'
        local root = vim.env.MASON or (vim.fn.stdpath('data') .. '/mason')
        opts = opts or {}
        opts.warn = opts.warn == nil and true or opts.warn
        path = path or ''
        local ret = root .. '/packages/' .. pkg .. '/' .. path
        require('dap-python').setup(ret)
    end,
}
