return {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
    opts = {
        -- See `:help gitsigns.txt`
        trouble = true,
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
            -- don't override the built-in and fugitive keymaps
            local gs = package.loaded.gitsigns
            vim.keymap.set({ 'n', 'v' }, ']c', function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
            vim.keymap.set({ 'n', 'v' }, '[c', function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })

            vim.keymap.set(
                'n',
                '<leader>g?',
                gs.blame_line,
                { silent = true, desc = 'Git blame line' }
            )
            vim.keymap.set(
                'n',
                '<leader>gh',
                gs.stage_hunk,
                { silent = true, desc = 'Git stage hunk' }
            )
            vim.keymap.set(
                'n',
                '<leader>gb',
                gs.stage_buffer,
                { silent = true, desc = 'Git stage buffer' }
            )
            vim.keymap.set(
                'n',
                '<leader>gu',
                gs.undo_stage_hunk,
                { silent = true, desc = 'Git unstage hunk' }
            )
        end,
    },
}
