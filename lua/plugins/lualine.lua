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
      component_separators = { " ", " " },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_b = { util.clients_lsp, 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        function()
          return "%="
        end,
        {
          "filename",
          file_status = true,
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = "󰐖",
            readonly = "",
            unnamed = "[No Name]",
            newfile = "[New File]",
          },
        }
      },
    },
  },
}
