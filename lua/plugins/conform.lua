return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
        format = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            sh = { 'shfmt' },
            yaml = { 'yamlfmt' },
        },
        formatters = {
            injected = { options = { ignore_errors = true } },
        },
    },
    keys = {
        {
            '<leader>cf',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            mode = 'n',
            desc = 'Conform format',
        },
    },
}
