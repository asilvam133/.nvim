return {
  'neovim/nvim-lspconfig',
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    'folke/neodev.nvim',
  },
  opts = {
    servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
      yamlls = {},
    },
  },
  config = function(_, opts)
    local util = require('util')

    -- setup keymaps
    util.on_attach(function(client, buffer)
      util.keys_on_attach(client, buffer)
    end)

    local register_capability = vim.lsp.handlers['client/registerCapability']

    vim.lsp.handlers['client/registerCapability'] = function(err, res, ctx)
      local ret = register_capability(err, res, ctx)
      local client_id = ctx.client_id
      ---@type lsp.Client
      local client = vim.lsp.get_client_by_id(client_id)
      local buffer = vim.api.nvim_get_current_buf()
      util.keys_on_attach(client, buffer)
      return ret
    end

    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend('force', {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup['*'] then
        if opts.setup['*'](server, server_opts) then
          return
        end
      end
      require('lspconfig')[server].setup(server_opts)
    end

    -- get all the servers that are available through mason-lspconfig
    local have_mason, mlsp = pcall(require, 'mason-lspconfig')
    local all_mslp_servers = {}
    if have_mason then
      all_mslp_servers = vim.tbl_keys(require('mason-lspconfig.mappings.server').lspconfig_to_package)
    end

    local ensure_installed = {} ---@type string[]
    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
        if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end
  end,
}
