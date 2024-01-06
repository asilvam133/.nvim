return {
    {
        'mrcjkb/rustaceanvim',
        version = '^3', -- Recommended
        ft = { 'rust' },
    },
    {
        'folke/which-key.nvim',
        optional = true,
        opts = {
            defaults = {
                ['<leader>cr'] = { name = '+Rust' },
            },
        },
    },
}
