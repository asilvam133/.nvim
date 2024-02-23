return {
    'tjdevries/express_line.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('el').reset_windows()

        vim.opt.laststatus = 3

        local builtin = require('el.builtin')
        local diagnostic = require('el.diagnostic')
        local extensions = require('el.extensions')
        local lsp_statusline = require('el.plugins.lsp_status')
        local sections = require('el.sections')
        local subscribe = require('el.subscribe')

        local has_lsp_extensions, ws_diagnostics =
            pcall(require, 'lsp_extensions.workspace.diagnostic')

        local git_icon = subscribe.buf_autocmd('el_file_icon', 'BufRead', function(_, bufnr)
            local icon = extensions.file_icon(_, bufnr)
            if icon then
                return icon .. ' '
            end

            return ''
        end)

        local git_branch = subscribe.buf_autocmd(
            'el_git_branch',
            'BufEnter',
            function(window, buffer)
                local branch = extensions.git_branch(window, buffer)
                if branch then
                    return ' ' .. extensions.git_icon() .. ' ' .. branch
                end
            end
        )

        local git_changes = subscribe.buf_autocmd(
            'el_git_changes',
            'BufWritePost',
            function(window, buffer)
                return extensions.git_changes(window, buffer)
            end
        )

        ---@diagnostic disable-next-line: unused-function, unused-local
        local ws_diagnostic_counts = function(_, buffer)
            if not has_lsp_extensions then
                return ''
            end

            local messages = {}

            local error_count = ws_diagnostics.get_count(buffer.bufnr, 'Error')

            local x = '⬤'
            if error_count == 0 then
            -- pass
            elseif error_count < 5 then
                table.insert(
                    messages,
                    string.format('%s#%s#%s%%*', '%', 'StatuslineError' .. error_count, x)
                )
            else
                table.insert(messages, string.format('%s#%s#%s%%*', '%', 'StatuslineError5', x))
            end

            return table.concat(messages, '')
        end

        local show_current_func = function(window, buffer)
            if buffer.filetype == 'lua' then
                return ''
            end

            return lsp_statusline.current_function(window, buffer)
        end

        local is_recording = function(_, _)
            local reg = vim.fn.reg_recording()
            if reg == '' then
                return ''
            end
            return ' @' .. reg .. ' '
        end

        local diagnostic_formatter = function(_, _, counts)
            local items = {}

            if counts.errors > 0 then
                table.insert(items, string.format(':%s', counts.errors))
            end

            if counts.warnings > 0 then
                table.insert(items, string.format(':%s', counts.warnings))
            end

            if counts.infos > 0 then
                table.insert(items, string.format(':%s', counts.infos))
            end

            if counts.hints > 0 then
                table.insert(items, string.format(':%s', counts.hints))
            end

            return table.concat(items, ' ')
        end

        local diagnostic_display = diagnostic.make_buffer(diagnostic_formatter)

        require('el').setup({
            generator = function()
                local mode = extensions.gen_mode({ format_string = ' %s ' })

                local items = {
                    { mode, required = true },
                    { git_branch },
                    { ' ' },
                    { sections.split, required = true },
                    { git_icon },
                    { sections.maximum_width(builtin.file_relative, 0.60), required = true },
                    { sections.collapse_builtin({ { ' ' }, { builtin.modified_flag } }) },
                    { sections.split, required = true },
                    { is_recording },
                    { diagnostic_display },
                    { show_current_func },
                    { lsp_statusline.server_progress },
                    { ws_diagnostic_counts },
                    { git_changes },
                    { '[' },
                    { builtin.line_with_width(3) },
                    { ':' },
                    { builtin.column_with_width(2) },
                    { ']' },
                    {
                        sections.collapse_builtin({
                            '[',
                            builtin.help_list,
                            builtin.readonly_list,
                            ']',
                        }),
                    },
                    { builtin.filetype },
                }

                local result = {}
                for _, item in ipairs(items) do
                    table.insert(result, item)
                end

                return result
            end,
        })
    end,
}
