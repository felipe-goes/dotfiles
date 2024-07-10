local status_ok, cyberdream = pcall(require, "cyberdream")
if not status_ok then
  vim.notify("Missing cyberdream: colorscheme.lua")
  return
end

cyberdream.setup({
  theme = {
    variant = "default",
    colors = {
      -- For a list of colors see `lua/cyberdream/colours.lua`
      bg = "#141618",
      bgAlt = "#1a1d20",
      bgHighlight = "#33363b",
      fg = "#d0d0d0",
      lightGrey = "#aacbff",
      grey = "#6c7688",
      blue = "#4e8cd1",
      green = "#4ed65e",
      cyan = "#4ecbd1",
      red = "#e74d3d",
      yellow = "#e8e847",
      magenta = "#e84ecb",
      pink = "#e84e8d",
      orange = "#e8b84e",
      purple = "#9e4ee8",
    },
  },

  -- Disable or enable colorscheme extensions
  extensions = {
    telescope = true,
    notify = true,
    mini = true,
    noice = true,
  },
})

vim.cmd("colorscheme cyberdream")
