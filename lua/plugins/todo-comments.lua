-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {},
  keys = {
    { '<leader>d', '<cmd>TodoTelescope<cr>', desc = 'Browse To[d]o comments' },
  },
}
