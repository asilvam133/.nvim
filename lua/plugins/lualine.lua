return {
    'nvim-lualine/lualine.nvim',
    opts = function()
        vim.o.laststatus = vim.g.lualine_laststatus

        local opts = {
            sections = {
                lualine_b = {},
                lualine_c = { LazyVim.lualine.pretty_path({ length = 10 }) },
            },
        }

        return opts
    end,
}
