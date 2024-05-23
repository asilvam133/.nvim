return {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
        search = {
            mode = 'search',
        },
        modes = {
            search = {
                enabled = true,
                highlight = { backdrop = true },
            },
        },
    },
}
