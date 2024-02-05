-- work related
return {
    'https://github.com/apple/pkl-neovim',
    event = 'BufReadPre *.pkl',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
    },
    build = function()
        vim.cmd('TSInstall! pkl')
    end,
}
