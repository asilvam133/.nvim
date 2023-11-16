local theme = 'rose-pine'

require('rose-pine').setup({
  disable_background = true,
})
local p = require('rose-pine.palette')

vim.cmd.colorscheme(theme)
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'String', { fg = p.rose })
vim.api.nvim_set_hl(0, 'Number', { fg = p.rose })
vim.api.nvim_set_hl(0, 'Float', { fg = p.rose })
vim.api.nvim_set_hl(0, 'Constant', { fg = p.rose })
vim.api.nvim_set_hl(0, 'Character', { fg = p.rose })
