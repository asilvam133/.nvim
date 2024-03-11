return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'meuter/lualine-so-fancy.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    config = function()
        local lualine = require('lualine')
        local webdevicons = require('nvim-web-devicons')
        local p = require('rose-pine.palette')

        local colors = {
            _nc = p._nc,
            base = p.base,
            surface = p.surface,
            overlay = p.overlay,
            muted = p.muted,
            subtle = p.subtle,
            text = p.text,
            love = p.love,
            gold = p.gold,
            rose = p.rose,
            pine = p.pine,
            foam = p.foam,
            iris = p.iris,
            highlight_low = p.highlight_low,
            highlight_med = p.highlight_med,
            highlight_high = p.highlight_high,
            none = p.none,
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
            end,
        }

        local function get_file_icon()
            local icon, iconhl = webdevicons.get_icon(
                vim.fn.expand('%:t'),
                vim.fn.expand('%:e'),
                { default = true, color = true }
            )
            return icon or '', iconhl
        end

        local config = {
            options = {
                disabled_filetypes = { 'fugitive', 'gitcommit' },
                component_separators = '',
                section_separators = '',
                theme = {
                    normal = { a = { fg = colors.text, bg = colors.none } },
                    inactive = { a = { fg = colors.text, bg = colors.none } },
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }

        local function insert_left_component(component)
            table.insert(config.sections.lualine_a, component)
        end

        local function insert_right_component(component)
            table.insert(config.sections.lualine_z, component)
        end

        insert_left_component({
            function()
                return '  '
            end,
            color = function()
                local mode_color = {
                    n = colors.rose,
                    i = colors.foam,
                    v = colors.iris,
                    V = colors.iris,
                    c = colors.love,
                    no = colors.rose,
                    s = colors.rose,
                    S = colors.rose,
                    ic = colors.gold,
                    R = colors.iris,
                    Rv = colors.iris,
                    cv = colors.love,
                    ce = colors.love,
                    r = colors.foam,
                    rm = colors.foam,
                    ['r?'] = colors.foam,
                    ['!'] = colors.love,
                    t = colors.love,
                }
                return { fg = mode_color[vim.fn.mode()], bg = colors.surface }
            end,
            padding = { left = 0, right = 1 },
            separator = { right = ' ', left = '' },
        })

        insert_left_component({
            'branch',
            icon = '󰊢',
            color = { fg = colors.gold, bg = colors.surface },
            separator = { right = ' ', left = ' ' },
            padding = { left = 0, right = 1 },
        })

        insert_left_component({
            'diff',

            symbols = { added = ' ', modified = ' ', removed = ' ' },
            diff_color = {
                added = { fg = colors.foam },
                modified = { fg = colors.iris },
                removed = { fg = colors.love },
            },
            color = { bg = colors.surface },
            cond = conditions.hide_in_width,
            separator = { right = ' ', left = ' ' },
            padding = { left = 1, right = 0 },
        })

        insert_left_component({
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', hint = '⚑ ', info = '󰌵 ' },
            diagnostics_color = {
                color_error = { fg = colors.love },
                color_warn = { fg = colors.gold },
                color_info = { fg = colors.foam },
            },
            separator = { right = ' ', left = ' ' },
            padding = { left = 0, right = 0 },
        })

        insert_left_component({
            function()
                local icon, iconhl = get_file_icon()
                return '%= %#' .. iconhl .. '#' .. icon .. ' ' .. vim.fn.expand('%') .. '%*'
            end,
            padding = { left = 0, right = 0 },
        })

        insert_right_component({
            'fancy_lsp_servers',
            cond = conditions.hide_in_width,
            color = { fg = colors.text, bg = colors.surface },
            separator = { right = ' ', left = ' ' },
            padding = { left = 1, right = 1 },
        })

        lualine.setup(config)
    end,
}
