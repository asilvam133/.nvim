return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'VeryLazy',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        -- From kickstart.nvim
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'c',
                    'css',
                    'devicetree',
                    'dockerfile',
                    'git_config',
                    'git_rebase',
                    'gitcommit',
                    'gitignore',
                    'go',
                    'gomod',
                    'gosum',
                    'gowork',
                    'html',
                    'http',
                    'json',
                    'jsonc',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'ninja',
                    'query',
                    'requirements',
                    'rst',
                    'ron',
                    'rust',
                    'scala',
                    'toml',
                    'vim',
                    'vimdoc',
                },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = false,
                    },
                },
            })
        end, 0)
    end,
}
