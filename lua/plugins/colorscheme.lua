return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
    },
    config = function()
      local p = require('rose-pine.palette')

      vim.cmd.colorscheme('rose-pine')
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'String', { fg = p.rose })
      vim.api.nvim_set_hl(0, 'Number', { fg = p.rose })
      vim.api.nvim_set_hl(0, 'Float', { fg = p.rose })
      vim.api.nvim_set_hl(0, 'Constant', { fg = p.rose })
      vim.api.nvim_set_hl(0, 'Character', { fg = p.rose })
    end,
  },
}
