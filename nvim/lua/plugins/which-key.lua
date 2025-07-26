return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    preset = 'helix',
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      -- breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
      -- separator = '➜', -- symbol used between a key and it's label
      -- group = '+', -- symbol prepended to a group
      -- ellipsis = '…',

      keys = {
        Up = '<Up>',
        Down = '<Down>',
        Left = '<Left>',
        Right = '<Right>',
        C = '<C-…>',
        M = '<M-…>',
        D = '<D-…>',
        S = '<S-…>',
        CR = '<CR>',
        Esc = '<Esc>',
        ScrollWheelDown = '󱕐',
        ScrollWheelUp = '󱕑',
        NL = '<NL>',
        BS = '<BS>',
        Space = '󱁐',
        Tab = '<Tab>',
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
      { '<leader>b', group = 'Buffer', icon = '' },
      { '<leader>c', group = 'Code' },
      { '<leader>g', group = 'Git' },
      { '<leader>f', group = 'File/Find' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'Lsp', mode = 'n', icon = ' ' },
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>u', group = 'UI', icon = { icon = '󰙵 ', color = 'cyan' } },
      { 'g', group = 'Go to', icon = '󰿅' },
      { 'z', group = 'Fold' },
    },
  },
}
