-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  event = 'VeryLazy',
  config = function()
    -- mini.surround
    require('mini.surround').setup {}

    -- mini.icons
    require('mini.icons').setup {
      style = 'glyph',

      file = {
        README = { glyph = '', hl = 'MiniIconsYellow' },
        ['README.md'] = { glyph = '', hl = 'MiniIconsYellow' },
        ['README.txt'] = { glyph = '', hl = 'MiniIconsYellow' },
        -- README = { glyph = '󰆈', hl = 'MiniIconsYellow' },
        -- ['README.md'] = { glyph = '󰆈', hl = 'MiniIconsYellow' },
      },

      filetype = {
        dotenv = { glyph = '', hl = 'MiniIconsYellow' },
        bash = { glyph = '󱆃', hl = 'MiniIconsGreen' },
        sh = { glyph = '󱆃', hl = 'MiniIconsGrey' },
        toml = { glyph = '󱄽', hl = 'MiniIconsOrange' },
        -- rust = { glyph = "🦀", hl = "MiniIconsOrange" },
      },
    }

    -- mini.statusline
    -- require('mini.statusline').setup {
    --   -- Content of statusline as functions which return statusline string. See
    --   -- `:h statusline` and code of default contents (used instead of `nil`).
    --   content = {
    --     -- Content for active window
    --     active = nil,
    --     -- Content for inactive window(s)
    --     inactive = nil,
    --   },
    --
    --   -- Whether to use icons by default
    --   use_icons = true,
    -- }
    --   require('mini.statusline').setup {
    --   use_icons = true,
    --
    --   content = {
    --     active = function()
    --       -- 获取 mode、filename、git 等
    --       local mode = '%m'  -- 示例：使用 Vim 自带模式标识
    --       local file = '%f'  -- 当前文件名
    --       local linecol = '%l:%c'  -- 行:列
    --       local git_branch = ''   -- 此处可接入 git 插件返回分支名
    --       if vim.b.gitsigns_head ~= nil then
    --         git_branch = ' ' .. vim.b.gitsigns_head
    --       end
    --
    --       -- 组合
    --       return table.concat {
    --         mode, ' ',
    --         git_branch, ' ',
    --         file, ' ',
    --         '%=',       -- 分隔符，左侧内容与右侧内容平衡
    --         linecol,
    --       }
    --     end,
    --
    --     inactive = function()
    --       -- 简化的状态栏，仅显示文件名
    --       return '%f'
    --     end,
    --   },
    -- }

    -- mini.tabline
    require('mini.tabline').setup {
      show_icons = true,
      format = function(buf_id, label)
        local MiniTabline = require('mini.tabline').default_format(buf_id, label)
        -- local suffix = vim.bo[buf_id].modified and "+ " or "  "
        -- return string.format("  %s%s", MiniTabline, suffix)
        return string.format(' %s ', MiniTabline)
      end,
    }
  end,
}

-- Better Around/Inside textobjects
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
-- require('mini.ai').setup { n_lines = 500 }

-- Add/delete/replace surroundings (brackets, quotes, etc.)
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
-- require('mini.diff').setup()
