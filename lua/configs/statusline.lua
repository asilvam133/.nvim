local modes = {
    ['n'] = 'NORMAL',
    ['no'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL LINE',
    ['s'] = 'SELECT',
    ['S'] = 'SELECT LINE',
    [''] = 'SELECT BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['Rv'] = 'VISUAL REPLACE',
    ['c'] = 'COMMAND',
    ['cv'] = 'VIM EX',
    ['ce'] = 'EX',
    ['r'] = 'PROMPT',
    ['rm'] = 'MOAR',
    ['r?'] = 'CONFIRM',
    ['!'] = 'SHELL',
    ['t'] = 'TERMINAL',
}

local function mode()
    local current_mode = vim.api.nvim_get_mode().mode
    return string.format(' %s ', modes[current_mode]):upper()
end

local function filepath()
    local fpath = vim.fn.fnamemodify(vim.fn.expand('%'), ':~:.:h')
    if fpath == '' or fpath == '.' then
        return ' '
    end

    return string.format(' %%<%s/', fpath)
end

local function filename()
    local fname = vim.fn.expand('%:t')
    if fname == '' then
        return ''
    end
    return fname .. ' '
end

local function lsp()
    local count = {}
    local levels = {
        errors = 'Error',
        warnings = 'Warn',
        info = 'Info',
        hints = 'Hint',
    }

    for k, level in pairs(levels) do
        count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
    end

    local errors = ''
    local warnings = ''
    local hints = ''
    local info = ''

    if count['errors'] ~= 0 then
        errors = ' %#LspDiagnosticsSignError# ' .. count['errors']
    end
    if count['warnings'] ~= 0 then
        warnings = ' %#LspDiagnosticsSignWarning# ' .. count['warnings']
    end
    if count['hints'] ~= 0 then
        hints = ' %#LspDiagnosticsSignHint# ' .. count['hints']
    end
    if count['info'] ~= 0 then
        info = ' %#LspDiagnosticsSignInformation# ' .. count['info']
    end

    return errors .. warnings .. hints .. info .. '%#Normal#'
end

local function filetype()
    return string.format(' %s ', vim.bo.filetype):upper()
end

local clients_lsp = function()
    local bufnr = vim.api.nvim_get_current_buf()

    local clients = vim.lsp.buf_get_clients(bufnr)
    if next(clients) == nil then
        return ''
    end

    local c = {}
    for _, client in pairs(clients) do
        table.insert(c, client.name)
    end
    return '\u{f085} ' .. table.concat(c, '|')
end

Statusline = {}

Statusline.active = function()
    return table.concat({
        '%#Statusline#',
        mode(),
        '%#String# ',
        clients_lsp(),
        '%#Function# ',
        filepath(),
        filename(),
        '%#Normal#',
        lsp(),
        '%=%#StatusLineExtra#',
        filetype(),
        -- lineinfo(),
    })
end

function Statusline.inactive()
    return ' %F'
end

vim.api.nvim_exec(
    [[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]],
    false
)