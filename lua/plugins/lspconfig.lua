return {
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {
        {
            'j-hui/fidget.nvim',
            opts = {
                notification = {
                    window = {
                        winblend = 0,
                    },
                },
                progress = {
                    display = {
                        progress_icon = { pattern = 'dots', period = 1 },
                    },
                },
            },
        },
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        local lsp_plugin = require('lspconfig')

        -- servers
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lsp_plugin.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                },
            },
        })
        lsp_plugin.yamlls.setup({})

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
                vim.keymap.set(
                    'n',
                    '<C-k>',
                    vim.lsp.buf.signature_help,
                    { buffer = ev.buf, desc = 'Signature help' }
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
                    '<space>wa',
                    vim.lsp.buf.add_workspace_folder,
                    { buffer = ev.buf, desc = 'Add workspace folder' }
                )
                vim.keymap.set(
                    'n',
                    '<space>wr',
                    vim.lsp.buf.remove_workspace_folder,
                    { buffer = ev.buf, desc = 'Remove workspace folder' }
                )
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, { buffer = ev.buf, desc = 'List workspace folders' })
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
                    { buffer = ev.buf, desc = 'Rename' }
                )
                vim.keymap.set(
                    { 'n', 'v' },
                    '<space>ca',
                    vim.lsp.buf.code_action,
                    { buffer = ev.buf, desc = 'Actions' }
                )
                vim.keymap.set(
                    'n',
                    '<space>cf',
                    vim.lsp.buf.format,
                    { buffer = ev.buf, desc = 'LSP format' }
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
