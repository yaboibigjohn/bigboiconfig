-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

--Colorizer attach to buffer
vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Highlight color strings using nvim-colorizer',
  group = vim.api.nvim_create_augroup('nvim-colorizer', { clear = true }),
  callback = function()
    vim.cmd 'ColorizerAttachToBuffer'
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
})
