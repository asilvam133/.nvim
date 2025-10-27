return {
    'nvim-lualine/lualine.nvim',
    enabled = false,
    opts = {
        sections = {
            lualine_c = { LazyVim.lualine.pretty_path({ length = 10 }) },
        },
    },
}
