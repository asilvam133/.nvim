vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--netrw
vim.g.netrw_sort_sequence = [[[\/]$,*]] -- directories first
vim.g.netrw_banner = 0

vim.o.expandtab = true
vim.o.shiftround = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.showmode = false
vim.o.guicursor = ''
vim.o.cursorline = false
vim.o.hlsearch = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = 'a'

vim.o.sessionoptions = 'tabpages,globals'
vim.o.breakindent = true

vim.o.undofile = true

vim.o.wrap = false

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = 'menu,menuone,noselect'

vim.o.termguicolors = true

vim.api.nvim_command('set fillchars=eob:\\ ')
