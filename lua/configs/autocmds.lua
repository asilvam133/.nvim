local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

local trailing_whitespaces_group =
    vim.api.nvim_create_augroup('TrailingWhitespaces', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
    group = trailing_whitespaces_group,
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

local formatoptions_group = vim.api.nvim_create_augroup('FormatOptionsGroup', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
    group = formatoptions_group,
    pattern = '*',
    command = 'set formatoptions-=o',
})

local conf_ft_colorscheme = vim.api.nvim_create_augroup('ConfFtColorscheme', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    group = conf_ft_colorscheme,
    pattern = '*.conf',
    command = [[setf config]],
})

-- [[ user commands  ]]
-- toggle diagnostics with 'Dg'
vim.api.nvim_create_user_command('Dg', function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, {})

-- manually change colorschemes based on background
local dark = 'rose-pine'
local light = 'tokyonight-day'
vim.api.nvim_create_user_command('Dt', function()
    vim.cmd.colorscheme(dark)
end, {})
vim.api.nvim_create_user_command('Lt', function()
    vim.cmd.colorscheme(light)
end, {})

--  manually change to any colorscheme
vim.api.nvim_create_user_command('Ct', function()
    local builtin = require('telescope.builtin')
    builtin.colorscheme()
end, {})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', {}),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0
    end,
})
