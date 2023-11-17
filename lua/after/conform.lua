require('conform').setup {
  format = {
    timeout_ms = 3000,
    async = false,
    quiet = false,
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    sh = { 'shfmt' },
    yaml = { 'yamlfmt' }
  },
  formatters = {
    injected = { options = { ignore_errors = true } },
  },
}

vim.keymap.set('n',
  '<leader>cc',
  function() require('conform').format({ async = true, lsp_fallback = true }) end,
  { desc = '[C]onform: [C]ode Format' }
)
