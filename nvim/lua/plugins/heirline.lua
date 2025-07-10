return {
  'rebelot/heirline.nvim',
  dependencies = { 'Zeioth/heirline-components.nvim' },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    local lib = require 'heirline-components.all'
    return {
      statusline = { -- UI statusbar
        hl = { fg = 'fg', bg = 'bg' },
        lib.component.mode(),
        lib.component.file_info {
          file_icon = { -- if set, displays a icon depending the current filetype.
            padding = { left = 0, right = 1 },
          },
          filename = {},
          filetype = false,
          file_modified = false,
        },
        lib.component.git_branch(),
        lib.component.git_diff {},
        lib.component.diagnostics(),
        lib.component.fill(),
        lib.component.cmd_info(),
        lib.component.fill(),
        lib.component.lsp {},
        lib.component.treesitter {},
        -- lib.component.file_encoding(),
        lib.component.compiler_state(),
        lib.component.virtual_env(),
        lib.component.nav {},
        lib.component.mode { surround = { separator = 'right' } },
      },
    }
  end,
  config = function(_, opts)
    local heirline = require 'heirline'
    local heirline_components = require 'heirline-components.all'

    -- Setup
    heirline_components.init.subscribe_to_events()
    heirline.load_colors(heirline_components.hl.get_colors())
    heirline.setup(opts)
  end,
}
