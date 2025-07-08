-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  opts = {
    window = {
      width = 30,
      mappings = {
        ['\\'] = 'close_window',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
    source_selector = {
      winbar = true,
      statusline = false,
    },
  },
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  default_component_configs = {
    indent = {
      with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    git_status = {
      symbols = {
        -- Change type
        -- added = '✚', -- or "✚", but this is redundant info if you use git_status_colors on the name
        added = '',
        deleted = '',
        modified = '',
        renamed = '󰁕', -- this can only be used in the git_status source
        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        -- modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
        -- deleted = '✖', -- this can only be used in the git_status sourceconflict = '',
      },
    },
  },
}
