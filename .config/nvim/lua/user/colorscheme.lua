local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  vim.notify("Missing tokyonight: colorscheme.lua")
  return
end

-- Lua
tokyonight.setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day", -- The theme is used when the background is set to light
  transparent = false, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help", "vista_kind", "terminal", "packer" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,
  -- on_colors = function(colors)
  --   colors.hint = colors.orange
  --   colors.error = "#ff0000"
  -- end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
})

tokyonight.load()

-- Color fixes for BufferLine and ColorColumn
-- Fixes apply only for Tokyo Night Night
vim.cmd([[
  " hi BufferLineFill guibg=#35314D
  " hi BufferLineSeparator guibg=#35314D
  " hi BufferLineSeparatorVisible guibg=#35314D
  " hi BufferLineBackground guibg=#3E3959
  " hi BufferLineCloseButton guibg=#3E3959
  " hi BufferLineDevIconLua guibg=#3E3959
  hi ColorColumn guibg=#35314D
  set termguicolors
]])
