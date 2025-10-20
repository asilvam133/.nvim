return {
    'stevearc/oil.nvim',
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    keys = {
        { '-', '<cmd>Oil<cr>', desc = 'Explorer' },
    },
}
