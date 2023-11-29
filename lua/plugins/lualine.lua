local util = require("util")

return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'arkav/lualine-lsp-progress',
  },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
    },
    sections = {
      lualine_b = { util.clients_lsp, 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'lsp_progress' },
    },
  },
}
