return {
  -- using lazy.nvim
  'akinsho/bufferline.nvim',
  enabled = false,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VeryLazy',

  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = 'neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },

          {
            filetype = 'snacks_layout_box',
          },
        },
        style_preset = {
          bufferline.style_preset.no_italic,
        },
      },
    }
  end,
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
}
