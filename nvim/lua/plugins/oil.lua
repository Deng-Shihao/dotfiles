return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  opts = {
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<C-k>'] = false,
      ['<C-j>'] = false,
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-s>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-r>'] = 'actions.refresh',
      ['<BS>'] = { 'actions.parent', mode = 'n' },
      ['q'] = { 'actions.close', mode = 'n' },
      ['<leader>e'] = { 'actions.close', mode = 'n' },
    },
  },
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    { '<leader>-', '<cmd>Oil --float<cr>', desc = 'Open parent float' },
    -- { '<leader>e', '<cmd>Oil --float<cr>', desc = 'Open parent float' },
  },
}
