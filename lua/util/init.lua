local M = {}
-- LSP clients attached to buffer
M.clients_lsp = function()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return 'LSP Stopped'
  end

  local c = {}
  for _, client in pairs(clients) do
    table.insert(c, client.name)
  end
  return '\u{f085} ' .. table.concat(c, ' | ')
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf ---@type number
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end
-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
function M.keys_on_attach(_, buffer)
  local Keys = require("lazy.core.handler.keys")
  local keymaps = M.resolve(buffer)

  for _, keys in pairs(keymaps) do
    if not keys.has or M.has(buffer, keys.has) then
      local opts = Keys.opts(keys)
      opts.has = nil
      opts.silent = opts.silent ~= false
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
    end
  end
end

function M.on_load(name, fn)
  local Config = require('lazy.core.config')
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    fn(name)
  else
    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyLoad',
      callback = function(event)
        if event.data == name then
          fn(name)
          return true
        end
      end,
    })
  end
end

M._keys = nil

function M.get()
  if M._keys then
    return M._keys
  end
    -- stylua: ignore
    M._keys =  {
      { '<leader>cf', vim.lsp.buf.format, desc = '[C]ode [F]ormat' },
      { "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, desc = "[G]oto [D]efinition", has = "definition" },
      { "gr", "<cmd>Telescope lsp_references<cr>", desc = "[G]oto [R]eferences" },
      { "gD", vim.lsp.buf.declaration, desc = "[G]oto [D]eclaration" },
      { "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, desc = "[G]oto [I]mplementation" },
      { "<leader>D", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, desc = "Type [D]efinition" },
      { "<leader>ss", function() require("telescope.builtin").lsp_document_symbols() end, desc = "[S]earch Document [S]ymbols" },
      { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
      {
        "<leader>cA",
        function()
          vim.lsp.buf.code_action({
            context = {
              only = {
                "source",
              },
              diagnostics = {},
            },
          })
        end,
        desc = "[C]ode [A]ction",
        has = "codeAction",
      }
    }
    M._keys[#M._keys + 1] = { '<leader>cn', vim.lsp.buf.rename, desc = '[C]ode Re[n]ame', has = 'rename' }
  return M._keys
end

function M.opts(name)
  local plugin = require('lazy.core.config').plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require('lazy.core.plugin')
  return Plugin.values(plugin, 'opts', false)
end

function M.get_config(server)
  local configs = require('lspconfig.configs')
  return rawget(configs, server)
end

function M.has(buffer, method)
  method = method:find('/') and method or 'textDocument/' .. method
  local clients = M.get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    if client.supports_method(method) then
      return true
    end
  end
  return false
end

function M.resolve(buffer)
  local Keys = require('lazy.core.handler.keys')
  if not Keys.resolve then
    return {}
  end
  local spec = M.get()
  local opts = M.opts('nvim-lspconfig')
  local clients = M.get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
    vim.list_extend(spec, maps)
  end
  return Keys.resolve(spec)
end

function M.get_clients(opts)
  local ret = {} ---@type lsp.Client[]
  if vim.lsp.get_clients then
    ret = vim.lsp.get_clients(opts)
  else
    ---@diagnostic disable-next-line: deprecated
    ret = vim.lsp.get_active_clients(opts)
    if opts and opts.method then
      ---@param client lsp.Client
      ret = vim.tbl_filter(function(client)
        return client.supports_method(opts.method, { bufnr = opts.bufnr })
      end, ret)
    end
  end
  return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

return M
