return {
  'rebelot/heirline.nvim',
  -- enabled = false,
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
  },
  config = function()
    vim.opt.cmdheight = 0
    require('heirline').setup {
      statusline = require 'plugins.heirline.statusline',
    }
  end,
}
