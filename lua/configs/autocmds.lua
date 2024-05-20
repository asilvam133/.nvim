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

-- manually change colorschemes
local dark = 'catppuccin-mocha'
local light = 'tokyonight-day'
vim.api.nvim_create_user_command('Dt', function()
    vim.cmd.colorscheme(dark)
end, {})
vim.api.nvim_create_user_command('Lt', function()
    vim.cmd.colorscheme(light)
end, {})
