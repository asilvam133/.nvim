return {
    'tjdevries/express_line.nvim',
    name = 'el',
    lazy = false,
    dependencies = {
        'j-hui/fidget.nvim',
        opts = {
            progress = {
                display = {
                    progress_icon = {
                        pattern = 'moon',
                    },
                },
            },
        },
    },
}
