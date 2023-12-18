return {
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {
            mode = 'search',
        },
        keys = {
            { "<leader>s<space>", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Jump" },
            { "<leader>ss",       mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Jump treesitter" },
            { "r",       mode = "o",               function() require("flash").remote() end,            desc = "Search remote" },
            { "R",       mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Search treesitter" },
        },
    },
    {
        'folke/which-key.nvim',
        optional = true,
        opts = {
            defaults = {
                ['<leader>s'] = { name = '+Search (Flash)' },
            },
        },
    }
}
