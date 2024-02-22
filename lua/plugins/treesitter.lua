return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
        -- From kickstart.nvim
        vim.defer_fn(function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = {
                    'bash',
                    'git_config',
                    'git_rebase',
                    'gitcommit',
                    'gitignore',
                    'html',
                    'json',
                    'lua',
                    'markdown',
                    'markdown_inline',
                    'python',
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
            })
        end, 0)
    end,
}
