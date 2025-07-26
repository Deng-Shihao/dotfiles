return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  opts = {
    keymaps = {
      ['<C-h>'] = false,
      ['<M-h>'] = 'actions.select_split',
      ['<M-l>'] = 'actions.refresh',
    },
  },
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    { '<leader>-', '<cmd>Oil --float<cr>', desc = 'Open parent float' },
  },
}
