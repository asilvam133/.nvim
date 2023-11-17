local util = require('util')
-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' },
      }
    },
  },
  yamlls = {},
}

local formatters = {
  'stylua',
  'yamlfmt',
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'
local mason = require 'mason'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason.setup {
  ensure_installed = formatters,
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = util.on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

local mr = require('mason-registry')
mr:on('package:install:success', function()
  vim.defer_fn(function()
    require('lazy.core.handler.event').trigger({
      event = 'FileType',
      buf = vim.api.nvim_get_current_buf(),
    })
  end, 100)
end)
local function ensure_installed()
  for _, tool in ipairs(formatters) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      p:install()
    end
  end
end
if mr.refresh then
  mr.refresh(ensure_installed)
else
  ensure_installed()
end
