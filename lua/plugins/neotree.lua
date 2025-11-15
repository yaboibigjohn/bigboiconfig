return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<c-n>', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
      filtered_items = {
        visible = true,
      },
    },
  },
}
