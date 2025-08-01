return {
  'nvimdev/dashboard-nvim',
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  dependencies = { 'akinsho/toggleterm.nvim' },
  opts = function()
    local logo = [[
                                        ▒▓                                 
                                      ▒██                                  
                                    ░▒██░                                  
                                    ▓▒██                                   
                                   █▒████                                  
                                  ▓█████▒░                                 
                                 ▒███████▒░                                
                                ░██▓█▒█▒██░                                
                                ▓███░▒░█▒█▒▒░                              
                               ▒███▒▒▒  █▒█░░                              
                              ░███▒░█   ░▒▓█░░               ░▒▒           
                             ░███▓░█     ▒▒▒█░░          ░░░███▒▓█▒        
                             ▒██▓▒▓▒░▒▒▒▒▓████████████████████████▓▓▒░░░▒▒▓
    ░▓░           ░░░░░░░▒▓████████▓▓▒▒▒▒▒▒████▓▓▒▒▒▒▒▒▓███████████▓▒░     
    ▒▓▒▓█▓▒▓█████████▓▒▒▒▒░░██████▓▓███████████░▒░░░░▓██▓▓█▒░▒▓░           
      ▒▓████████████████▒▒░█▓███▓           ▓▓▒▓░░░▒▓▒▒▓▓░░▒▒░             
    ░▒▓█▓▒▒▓▓▓▓█▓██▓████▓▒▒▓█▓▓▓            ░▓█▒▓▓▓▒▓▓▒░░▒░                
░░░░░░          ░░▒▒░▓▓▒███████░             ▒█████▓▒░▒░░                  
                     ░▒░░███████▒▒░░       ░▒▒████▒▒▓░                     
                        ▒██████▓░▒▒▓▒▒▒░░▒▒▒▒▓██▓██ ░░                     
                        ███▓▒▒░▓▒▓▓▒▓░▒██████▒░█▓▓▓▒░░                     
                       ▓▓█▒░█     ░▓███████▒███░▒▒█▓░░░                    
                      ░▓█▓▒▒     ░▒▒▒▓██████▒▒▒░▒███▓░░░                   
                     ░▓██▓░░   ░▒▒▒▓▒█▓▒▒░░▒███▓▒▓█▒████▒                  
                     ▒██▓░▒░ ▒▒▒▒▓▒█▓▒▒░      ░░▓██████░▓▓██▒░             
                    ░███▓▒░▒▒▒▓▓▒▓▓▒░░             ▓██████▒░▒▓███▒░        
                    ▒██▓▒█▓▒▓▓▓█▓▒░░                ▓▓█▒████▓▓▓▓▒▓████▓░   
                    █████▓█▒▒▓▓░░░                  ░▓▓█▒▒▒░░▓█▓░░▒█▓▒░▓██░
                   ░███▓█▓▒█▒░░                      ▒▒▓▓▓░▒    ░▒▓▓▒▒▒▒▒░ 
                 ░▒█████▓█▓▒░                         ▒▒█▓▓░▒           ░░░
               ▒▒░░██▓▓███░                           ░▒▓█▓▓▒▒             
             ▒▒░░▒██ ░▓█░                              ▓▒███▓▒░            
                 ░▓░░░▓▓                                ▓▒███▓▓░           
                 ░░ ░▓▒░                                ▒▒████▓▒░          
                    ▒▓░                                   ▓███▒█           
                                                            ░█▒               ]]

    logo = string.rep('\n', 8) .. logo .. '\n\n'

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, '\n'),
        -- stylua: ignore
        center = {
          { action = 'cd ~/Sources/workxit/versatrak-mobile-reactnative/|2TermExec cmd="WsaClient /launch wsa://com.veracitygroupinc.versatrak & npx expo start --clear --dev-client" direction=float', desc = " Work on Mobile", icon = " ", key = "m" },
          { action = 'cd ~/OneDrive/Documents/Writing Projects/ | edit Landing.md | 2TermExec cmd="obsidian" direction=float | 2ToggleTerm', desc = " Work on Writing", icon = "󱚌 ", key = "w" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
      button.key_format = '  %s'
    end

    -- open dashboard after closing lazy
    if vim.o.filetype == 'lazy' then
      vim.api.nvim_create_autocmd('WinClosed', {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
          end)
        end,
      })
    end

    return opts
  end,
}
