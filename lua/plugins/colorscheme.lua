return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    opts = function()
      local p = require('rose-pine.palette')
      return {
        disable_background = true,
        highlight_groups = {
          Normal = { bg = 'none' },
          NormalFloat = { bg = 'none' },
          Question = { fg = p.rose },
          RedrawDebugClear = { fg = '#ffffff', bg = p.rose },
          Character = { fg = p.rose },
          Constant = { fg = p.rose },
          Float = { fg = p.rose },
          Number = { fg = p.rose },
          String = { fg = p.rose },
          BufferCurrentTarget = { fg = p.rose, bg = p.overlay },
          BufferInactiveTarget = { fg = p.rose },
          BufferVisibleTarget = { fg = p.rose },
          ModesCopy = { bg = p.rose },
          NeoTreeGitUntracked = { fg = p.rose },
          WhichKeyDesc = { fg = p.rose },
          CmpItemKindSnippet = { fg = p.rose },
          LspSagaCodeActionTitle = { fg = p.rose, bold = true },
          LspSagaDiagnosticHeader = { fg = p.rose, bold = true },
          LspSagaFinderSelection = { fg = p.rose },
          PounceAcceptBest = { fg = p.base, bg = p.rose },
          DapUIThread = { fg = p.rose },
          DapUIBreakpointsCurrentLine = { fg = p.rose, bold = true },
          DashboardCenter = { fg = p.rose },
          NavicIconsConstructor = { fg = p.rose },
          NavicIconsEnum = { fg = p.rose },
          NavicIconsConstant = { fg = p.rose },
          NavicIconsString = { fg = p.rose },
          NavicIconsNumber = { fg = p.rose },
          NavicIconsArray = { fg = p.rose },
          NavicIconsObject = { fg = p.rose },
          NavicIconsEvent = { fg = p.rose },
          AlphaFooter = { fg = p.rose },
          -- GitSigns
          GitSignsAdd = { bg = 'none'},
          GitSignsChange = { bg = 'none'},
          GitSignsDelete = { bg = 'none'},
        },
      }
    end,
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.cmd.colorscheme('rose-pine')
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
    -- config = function(_, opts)
    --   require('catppuccin').setup(opts)
    --   vim.cmd.colorscheme('catppuccin-mocha')
    -- end,
  }
}
