return {
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
        servers = {
            html = {},
            jsonls = {},
            gopls = {
                settings = {
                    gopls = {
                        gofumpt = true,
                        codelenses = {
                            gc_details = false,
                            generate = true,
                            regenerate_cgo = true,
                            run_govulncheck = true,
                            test = true,
                            tidy = true,
                            upgrade_dependency = true,
                            vendor = true,
                        },
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                        analyses = {
                            nilness = true,
                            unusedparams = true,
                            unusedwrite = true,
                            useany = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        directoryFilters = {
                            '-.git',
                            '-.vscode',
                            '-.idea',
                            '-.vscode-test',
                            '-node_modules',
                        },
                        semanticTokens = true,
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        diagnostics = {
                            disable = {
                                'missing-fields',
                            },
                            globals = {
                                'vim',
                            },
                        },
                        workspace = {
                            checkThirdParty = false,
                        },
                    },
                },
            },
            marksman = {},
            taplo = {},
            yamlls = {},
        },
    },
    config = function(_, opts)
        local lsp_plugin = require('lspconfig')
        local cmp = require('cmp')

        -- cmp
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            ---@diagnostic disable-next-line: undefined-field
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                {
                    name = 'cmdline',
                    option = {
                        ignore_cmds = { 'Man', '!' },
                    },
                },
            }),
        })

        -- servers
        local on_attach = require('utils.lsp').on_attach
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local servers = opts.servers

        -- extended lua API signature help
        require('neodev').setup()

        for server, server_opts in pairs(servers) do
            lsp_plugin[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = server_opts.settings and server_opts.settings or {},
            })
        end

        local builtin = require('telescope.builtin')
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                vim.keymap.set(
                    'n',
                    'K',
                    vim.lsp.buf.hover,
                    { buffer = ev.buf, desc = 'Hover signature' }
                )
                -- on by default
                vim.keymap.set('n', '<leader>ui', function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
                end, { buffer = ev.buf, desc = 'Inlay hints (Toggle)' })
                vim.keymap.set(
                    'n',
                    '<M-k>',
                    vim.lsp.buf.signature_help,
                    { buffer = ev.buf, desc = 'Signature help' }
                )
                vim.keymap.set(
                    { 'n', 'v' },
                    '<space>ca',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'Code actions' }
                )
                vim.keymap.set(
                    'n',
                    'gd',
                    builtin.lsp_definitions,
                    { buffer = ev.buf, desc = 'Go to definition' }
                )
                vim.keymap.set(
                    'n',
                    'gD',
                    vim.lsp.buf.declaration,
                    { buffer = ev.buf, desc = 'Go to declaration' }
                )
                vim.keymap.set(
                    'n',
                    'gi',
                    builtin.lsp_implementations,
                    { buffer = ev.buf, desc = 'Go to implementation' }
                )
                vim.keymap.set(
                    'n',
                    '<space>D',
                    builtin.lsp_type_definitions,
                    { buffer = ev.buf, desc = 'Type definition' }
                )
                vim.keymap.set(
                    'n',
                    '<space>cn',
                    vim.lsp.buf.rename,
                    { buffer = ev.buf, desc = 'Code rename' }
                )
                vim.keymap.set(
                    'n',
                    'gr',
                    vim.lsp.buf.references,
                    { buffer = ev.buf, desc = 'Go to references' }
                )
            end,
        })
    end,
    keys = {
        { '<space>e', vim.diagnostic.open_float, mode = 'n', desc = 'Hover diagnostic' },
    },
}
