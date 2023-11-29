return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    -- lazy = false,
    priority = 1000,
    opts = function()
      local lighter_gold = "#DFBCAB"
      return {
        disable_background = true,
        highlight_groups = {
          Normal = { bg = 'none' },
          NormalFloat = { bg = 'none' },
          Question = { fg = lighter_gold },
          RedrawDebugClear = { fg = lighter_gold },
          WarningMsg = { fg = lighter_gold },
          Character = { fg = lighter_gold },
          Constant = { fg = lighter_gold },
          Float = { fg = lighter_gold },
          Number = { fg = lighter_gold },
          String = { fg = lighter_gold },
          BufferCurrentTarget = { fg = lighter_gold },
          BufferInactiveTarget = { fg = lighter_gold },
          BufferVisibleTarget = { fg = lighter_gold },
          ModesCopy = { fg = lighter_gold },
          WhichKeyDesc = { fg = lighter_gold },
          CmpItemKindSnippet = { fg = lighter_gold },
          DapUIThread = { fg = lighter_gold },
          DapUIBreakpointsCurrentLine = { fg = lighter_gold },
          TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
          TelescopeNormal = { bg = 'none' },
          TelescopePromptNormal = { bg = 'base' },
          TelescopeResultNormal = { fg = 'subtle', bg = 'none' },
          TelescopeSelection = { fg = 'text', bg = 'base' },
        },
      }
    end,
    -- config = function(_, opts)
    --   require('rose-pine').setup(opts)
    --   vim.cmd.colorscheme('rose-pine')
    -- end,
  },
  {
    'shaunsingh/nord.nvim',
    name = 'nord',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_disable_background = true
      require('nord').set()
    end
  }
}
