return {
    'laytan/cloak.nvim',
    event = 'BufRead',
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
