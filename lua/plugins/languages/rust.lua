return {
  -- Extend auto completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'Saecki/crates.nvim',
        event = { 'BufRead Cargo.toml' },
        opts = {
          src = {
            cmp = { enabled = true },
          },
        },
      },
    },
    opts = function(_, opts)
      local cmp = require('cmp')
      opts.sources = cmp.config.sources(
        vim.list_extend(
          opts.sources, {
            { name = 'crates' },
          }))
    end,
  },

  -- Add Rust & related to treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'ron', 'rust', 'toml' })
      end
    end,
  },

  -- Ensure Rust debugger is installed
  {
    'williamboman/mason.nvim',
    optional = true,
    opts = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        vim.list_extend(opts.ensure_installed, { 'codelldb' })
      end
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    opts = function()
      local ok, _ = pcall(require, 'mason-registry')
      local adapter ---@type any
      if ok then
        -- rust tools configuration for debugging support
        local extension_path = vim.env.HOME .. '.local/share/nvim/mason/packages/codelldb/extension/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
      end
      return {
        dap = {
          adapter = adapter,
        },
        tools = {
          on_initialized = function()
            vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
          end,
        },
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set('n', 'K', require('rust-tools').hover_actions.hover_actions,
              { buffer = bufnr, desc = 'Rust: Hover Documentation' })
            -- Code action groups
            vim.keymap.set('n', '<Leader>ca', require('rust-tools').code_action_group.code_action_group,
              { buffer = bufnr, desc = 'Rust: [C]ode [A]ction' })
            -- Inlay hints
            vim.keymap.set('n', '<leader>cri', require('rust-tools').inlay_hints.enable,
              { buffer = bufnr, desc = 'Rust: Enable [I]nlay Hints' })
            vim.keymap.set('n', '<leader>crd', require('rust-tools').inlay_hints.disable,
              { buffer = bufnr, desc = 'Rust: [D]isable inlay hints' })
            -- Runnables
            vim.keymap.set('n', '<leader>crr', require('rust-tools').runnables.runnables,
              { buffer = bufnr, desc = 'Rust: [R]unnables' })
          end,
        }
      }
    end,
    config = function() end,
  },
  -- Correctly setup lspconfig for Rust 🚀
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        -- Ensure mason installs the server
        rust_analyzer = {
          keys = {
            { 'K',          '<cmd>RustHoverActions<cr>', desc = 'Hover Actions (Rust)' },
            { '<leader>cR', '<cmd>RustCodeAction<cr>',   desc = 'Code Action (Rust)' },
            { '<leader>dr', '<cmd>RustDebuggables<cr>',  desc = 'Run Debuggables (Rust)' },
          },
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                runBuildScripts = true,
              },
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ['async-trait'] = { 'async_trait' },
                  ['napi-derive'] = { 'napi' },
                  ['async-recursion'] = { 'async_recursion' },
                },
              },
            },
          },
        },
        taplo = {
          keys = {
            {
              'K',
              function()
                if vim.fn.expand('%:t') == 'Cargo.toml' and require('crates').popup_available() then
                  require('crates').show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = 'Show Crate Documentation',
            },
          },
        },
      },
      setup = {
        rust_analyzer = function(_, opts)
          local rust_tools_opts = require('util').opts('rust-tools.nvim')
          require('rust-tools').setup(vim.tbl_deep_extend('force', rust_tools_opts or {}, { server = opts }))
          return true
        end,
      },
    },
  },

  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'rouge8/neotest-rust',
    },
    opts = {
      adapters = {
        ['neotest-rust'] = {},
      },
    },
  },
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'rouge8/neotest-rust',
    },
    opts = {
      adapters = {
        ['neotest-rust'] = {},
      },
    },
  },

}
