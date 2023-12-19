return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
    config = function(_, opts)
        require('nvim-tree').setup(opts)
    end,
    keys = {
        {
            '<leader>fc',
            function()
                require('nvim-tree.api').tree.toggle()
            end,
            mode = 'n',
            desc = 'File explorer (cwd)',
        },
    },
}
