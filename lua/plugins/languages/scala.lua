return {
    'scalameta/nvim-metals',
    ft = { 'scala', 'sbt' },
    dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
    config = function()
        local metals_config = require('metals').bare_config()
        metals_config.init_options.statusBarProvider = 'on'
        metals_config.settings = {
            showImplicitArguments = true,
            inlayHints = false,
            excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
        }
        metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()
        metals_config.on_attach = function(_, _)
            require('metals').setup_dap()
        end

        local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'scala', 'sbt' },
            callback = function()
                require('metals').initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })

        -- Debug settings
        local dap = require('dap')
        dap.configurations.scala = {
            {
                type = 'scala',
                request = 'launch',
                name = 'Run or test',
                metals = {
                    runType = 'runOrTestFile',
                },
            },
            {
                type = 'scala',
                request = 'launch',
                name = 'Test build target',
                metals = {
                    runType = 'testTarget',
                },
            },
        }
    end,
}
