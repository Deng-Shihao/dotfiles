-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "catppuccin",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        -- init = { -- this table overrides highlights in all themes
        --   -- Normal = { bg = "#000000" },
        -- },
        -- astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        --   -- Normal = { bg = "#000000" },
        -- },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },

  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",

    opts = {
      no_italic = true,
      transparent_background = true,
      term_colors = true,
      integrations = {
        aerial = true,
        diffview = true,
        mini = {
          enabled = true,
          indentscope_color = "sky",
        },
        noice = true,
        nvimtree = false,
        neotree = true,
        which_key = true,
        treesitter = true,
        notify = true,
        gitsigns = true,
        flash = true,
        blink_cmp = true,
        mason = true,
        snacks = true,
      },
    },
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "helix",
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 30,
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
