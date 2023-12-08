return {
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { '<leader>st', '<cmd>TodoTelescope<cr>', mode = 'n', desc = 'Search Todo-Comments' },
      { '<leader>xt', '<cmd>TodoQuickFix<cr>',  mode = 'n', desc = 'Quickfix: Todo-Comments' },
    }
  },
}
