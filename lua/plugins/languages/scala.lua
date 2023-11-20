return {
  'scalameta/nvim-metals',
  dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
  config = function()
    local util = require('util')

    -- scala
    local api = vim.api
    -- options
    vim.opt_global.completeopt = { 'menuone', 'noinsert', 'noselect' }
    vim.opt_global.shortmess:remove('F')
    vim.opt_global.shortmess:remove('c')

    -- LSP setup
    local metals_config = require('metals').bare_config()

    -- settings
    metals_config.settings = {
      showImplicitArguments = true,
      showInferredType = true,
      superMethodLensesEnabled = true,
      showImplicitConversionsAndClasses = true,
    }

    metals_config.init_options.statusBarProvider = 'on'

    metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- DAP
    local dap = require('dap')

    dap.configurations.scala = {
      {
        type = 'scala',
        request = 'launch',
        name = 'RunOrTest',
        metals = {
          runType = 'runOrTestFile',
        },
      },
      {
        type = 'scala',
        request = 'launch',
        name = 'Test Target',
        metals = {
          runType = 'testTarget',
        },
      },
    }

    metals_config.on_attach = function(client, bufnr)
      util.on_attach(client, bufnr)
      require('metals').setup_dap()
    end

    -- autocmd to start the server with all the configurations above
    local nvim_metals_group = api.nvim_create_augroup('nvim-metals', { clear = true })

    api.nvim_create_autocmd('FileType', {
      pattern = { 'scala', 'sbt', 'java' },
      callback = function()
        require('metals').initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
  keys = {
    { '<leader>cs<space>', function() require('telescope').extensions.metals.commands() end, mode = 'n', desc = 'Commands' },
    { '<leader>csa', function() require('metals').new_scala_file() end, mode = 'n', desc = 'New Scala file' },
    { '<leader>csr', function() require('metals').restart_metals() end, mode = 'n', desc = 'Restart Metals' },
  },
}
