return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
        'MunifTanjim/nui.nvim',
        {
            'rcarriga/nvim-notify',
            opts = {
                background_colour = '#000000',
            },
        },
    },
    opts = {
        cmdline = {
            enabled = true,
        },
        messages = {
            enabled = true,
        },
        lsp = {
            enabled = false,
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        popupmenu = {
            enabled = false,
        },
        routes = {
            {
                filter = {
                    event = 'msg_show',
                    kind = '',
                    find = 'written',
                },
                opts = { skip = true },
            },
        },
        views = {
            mini = {
                win_options = {
                    winblend = 0,
                },
            },
        },
    },
    keys = {
        { '<leader>n', '<cmd>Noice dismiss<cr>', mode = 'n', desc = 'Noice dismiss' },
    },
}
