return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = true, -- Force no italic
      no_bold = true, -- Force no bold
      no_underline = true, -- Force no underline
      integrations = {
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = {
          enabled = true,
          indentscope_color = 'sky',
        },
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        blink_cmp = true,
      },
      highlight_overrides = {
        mocha = function(mocha)
          return {
            CursorLineNr = { fg = mocha.green },
          }
        end,
      },
    }
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'catppuccin-frappe', 'catppuccin-macchiato', or 'catppuccin-latte'.
    vim.cmd.colorscheme 'catppuccin'
  end,
}
