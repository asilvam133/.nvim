vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.showmode = false
vim.o.cursorline = true
vim.o.colorcolumn = '100'

vim.o.hlsearch = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.breakindent = true

vim.o.undofile = true

vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menu,menuone,noselect'

vim.o.termguicolors = true

vim.api.nvim_command('set fillchars=eob:\\ ')

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local dap_signs = {
    Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
    Breakpoint = ' ',
    BreakpointCondition = ' ',
    BreakpointRejected = { ' ', 'DiagnosticError' },
    LogPoint = '.>',
}

for name, sign in pairs(dap_signs) do
    sign = type(sign) == 'table' and sign or { sign }
    vim.fn.sign_define(
        'Dap' .. name,
        { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] }
    )
end
