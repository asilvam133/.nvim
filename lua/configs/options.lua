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

local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
