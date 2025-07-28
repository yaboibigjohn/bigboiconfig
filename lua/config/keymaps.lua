-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
--
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--ctrl movement
vim.keymap.set({ 'i' }, '<C-h>', '<left>', { desc = 'move left' })
vim.keymap.set({ 'i' }, '<C-j>', '<down>', { desc = 'move down' })
vim.keymap.set({ 'i' }, '<C-k>', '<up>', { desc = 'move up' })
vim.keymap.set({ 'i' }, '<C-l>', '<right>', { desc = 'move right' })

--location shortcuts
vim.keymap.set({ 'n' }, '<Leader>gwm', '<cmd>cd ~/Sources/workxit/versatrak-mobile-reactnative/<cr>', { desc = 'nav to vtmobile' })
vim.keymap.set({ 'n' }, '<Leader>gg', '<cmd>cd ~/Sources/games/<cr>', { desc = 'nav to games root' })
vim.keymap.set({ 'n' }, '<Leader>gcf', '<cmd>cd ~/AppData/Local/nvim/<cr>', { desc = 'nav to nvim config' })

--comment line
vim.keymap.set({ 'n', 'v' }, '<leader>/', '<cmd>normal gcc<cr>', { desc = 'comment line' })
