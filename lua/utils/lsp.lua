local M = {}

function M.on_attach(_, bufnr)
    vim.lsp.inlay_hint.enable(bufnr, true)
end

return M
