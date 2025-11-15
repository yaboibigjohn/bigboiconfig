return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {--[[ things you want to change go here]]
  },
  keys = {
    --Basic commands
    { mode = { 'n', 'v', 'i', 't' }, '<A-h>', '<cmd>1ToggleTerm direction=horizontal size=30<cr>', desc = 'open horizontal term' },
    { mode = { 'n', 'v', 'i', 't' }, '<A-i>', '<cmd>2ToggleTerm direction=float<cr>', desc = 'open floating term' },
    { mode = { 'n', 'v', 'i', 't' }, '<A-v>', '<cmd>3ToggleTerm direction=vertical size=60<cr>', desc = 'open veritcal term' },

    --Expo commands
    {
      mode = { 'n' },
      '<leader>rx',
      '<cmd>2TermExec cmd="npx expo start --dev-client" direction=float<cr>',
      desc = 'run expo',
    },
    {
      mode = { 'n' },
      '<leader>rcx',
      '<cmd>2TermExec cmd="npx expo start --clear --dev-client" direction=float<cr>',
      desc = 'run expo with cleared cache',
    },
    {
      mode = { 'n' },
      '<leader>rbxa',
      '<cmd>3TermExec cmd="npx eas build --profile previewApk --platform android" direction=vertical size=60<cr>',
      desc = 'android eas build',
    },
    {
      mode = { 'n' },
      '<leader>rbxi',
      '<cmd>3TermExec cmd="npx eas build --profile previewIos --platform ios" direction=vertical size=60<cr>',
      desc = 'iOS eas build',
    },
  },
}
