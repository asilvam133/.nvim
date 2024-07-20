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
            html = { 'htmlbeautifier' },
            lua = { 'stylua' },
            go = { 'goimports', 'gofumpt' },
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
            '<leader>cf',
            function()
                require('conform').format({ async = true, lsp_fallback = true })
            end,
            mode = 'n',
            desc = 'Conform format',
        },
    },
}
