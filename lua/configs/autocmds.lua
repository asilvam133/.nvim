
-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local trailing_whitespaces_group = vim.api.nvim_create_augroup('TrailingWhitespaces', { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = trailing_whitespaces_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
