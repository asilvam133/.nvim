return {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = { 'rust' },
    config = function()
        local on_attach = require('utils.lsp').on_attach

        vim.g.rustaceanvim = {
            server = {
                on_attach = on_attach,
            },
        }
    end,
}
