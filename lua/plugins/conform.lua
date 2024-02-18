return {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    opts = {
        format = {
            timeout_ms = 3000,
            async = false,
            quiet = false,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'black' },
            sh = { 'shfmt' },
            toml = { 'taplo' },
            yaml = { 'yamlfmt' },
        },
        formatters = {
            injected = { options = { ignore_errors = true } },
        },
    },
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            mode = 'n',
            desc = 'Conform format',
        },
    },
}
