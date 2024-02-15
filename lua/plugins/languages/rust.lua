return {
    'mrcjkb/rustaceanvim',
    version = '^3', -- Recommended
    ft = { 'rust' },
    config = function()
        local navic = require('nvim-navic')
        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, bufnr)
            end
        end
        vim.g.rustaceanvim = {
            server = {
                on_attach = on_attach,
            },
        }
    end,
}
