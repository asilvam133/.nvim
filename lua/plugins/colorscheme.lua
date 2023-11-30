return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = {
      disable_background = true,
      highlight_groups = {
        Normal = { bg = 'none' },
        NormalFloat = { bg = 'none' },
      }
    },
    -- config = function(_, opts)
    --   require('rose-pine').setup(opts)
    --   vim.cmd.colorscheme('rose-pine')
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd.colorscheme('catppuccin-mocha')
    end,
  }
}
