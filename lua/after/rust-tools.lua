-- rust-tools
local rt = require('rust-tools')
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr, desc = 'Rust: Hover Documentation' })
      -- Code action groups
      vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group,
        { buffer = bufnr, desc = 'Rust: [C]ode [A]ction' })
      -- Inlay hints
      vim.keymap.set('n', '<leader>cri', rt.inlay_hints.enable, { buffer = bufnr, desc = 'Rust: Enable [I]nlay Hints' })
      vim.keymap.set('n', '<leader>crd', rt.inlay_hints.disable, { buffer = bufnr, desc = 'Rust: [D]isable inlay hints' })
      -- Runnables
      vim.keymap.set('n', '<leader>crr', rt.runnables.runnables, { buffer = bufnr, desc = 'Rust: [R]unnables' })
    end,
  }
})
