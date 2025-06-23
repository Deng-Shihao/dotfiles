return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
      term_colors = true,
      no_italic = true, -- Force no italic
    },
  },

  -- Configure LazyVim to load Catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
