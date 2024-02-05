return {
    'laytan/cloak.nvim',
    lazy = false,
    opts = {
        enabled = true,
        cloak_character = '*',
        highlight_group = 'Comment',
        patterns = {
            {
                file_pattern = {
                    '.env*',
                    'credentials.*',
                },
                cloak_pattern = '=.+',
            },
        },
    },
}
