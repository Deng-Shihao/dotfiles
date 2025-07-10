return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = 'helix',
      delay = 0,
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.o.timeoutlen
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
        separator = '➜', -- symbol used between a key and it's label
        group = '+', -- symbol prepended to a group
        ellipsis = '…',

        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = 'code' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>f', group = 'file/find' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>u', group = 'ui', icon = { icon = '󰙵 ', color = 'cyan' } },
        { '<leader>g', group = 'git' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { 'g', group = 'goto' },
        { 'z', group = 'fold' },
      },
    },
  },
}
