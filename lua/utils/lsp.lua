local M = {}

function M.on_attach(_, bufnr)
    vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
end

return M
