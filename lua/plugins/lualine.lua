local util = require("util")

return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      lazy = true,
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_b = { util.clients_lsp, 'branch', 'diff', 'diagnostics' },
      },
    },
  },

}
