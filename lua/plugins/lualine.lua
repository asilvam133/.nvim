local clients_lsp = function()
    local bufnr = vim.api.nvim_get_current_buf()

    local clients = vim.lsp.buf_get_clients(bufnr)
    if next(clients) == nil then
        return ''
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end
    return '\u{f085} ' .. table.concat(c, '|')
end

return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
        },
        sections = {
            lualine_c = { clients_lsp, 'filename' },
        },
    },
    config = function(_, opts)
        require('lualine').setup(opts)
    end,
}
