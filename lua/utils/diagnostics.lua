local M = {}

M.signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

local sign_define = vim.fn.sign_define

for type, icon in pairs(M.signs) do
    local hl = 'DiagnosticSign' .. type
    sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    float = { border = 'rounded' },
    virtual_text = {
        spacing = 4,
        source = 'if_many',
        prefix = '●',
    },
    severity_sort = true,
})

return M
