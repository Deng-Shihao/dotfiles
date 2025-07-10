return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
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
