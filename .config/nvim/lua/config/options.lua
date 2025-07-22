-- :help options
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 2,                       -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                    -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  -- showmode = false,                    -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- never show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  -- splitbelow = true,                   -- force all horizontal splits to go below current window
  -- splitright = true,                   -- force all vertical splits to go to the right of current window
  swapfile = false,     -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 300,     -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,      -- enable persistent undo
  updatetime = 300,     -- faster completion (4000ms default)
  redrawtime = 10000,   -- allow more time for loading syntax on large files
  writebackup = false,  -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,     -- convert tabs to spaces
  shiftwidth = 2,       -- the number of spaces inserted for each indentation
  tabstop = 2,          -- insert 2 spaces for a tab
  softtabstop = 2,
  -- cursorline = true,                   -- highlight the current line
  number = true,         -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4,       -- set number column width to 2 {default 4}
  wrap = false,          -- display lines as one long line
  scrolloff = 8,         -- is one of my fav
  sidescrolloff = 8,
  -- guifont = "monospace:h17",           -- the font used in graphical neovim applications
  hidden = true,
  title = true,
  -- wildmode= "longest:full,full",
  list = true,
  listchars = "tab:▸ ,trail:·",
  joinspaces = true,
  confirm = true,
  exrc = true,
  shell = "/usr/bin/bash",
  laststatus = 3,        -- avante: views can only be fully collapsed with the global statusline. 2 for local and 3 for global status line
  winborder = "rounded", -- Set the default border for all floating windows
  inccommand = "split"   -- Preview substitutions
}

vim.cmd("set shortmess+=c")
vim.cmd("set colorcolumn=80")
vim.cmd("set signcolumn=yes:1") -- always show the sign column, otherwise it would shift the text each time
vim.cmd("set wildmode=longest:full,full")
vim.cmd("let g:loaded_ruby_provider = 0")
vim.cmd("let g:loaded_node_provider = 0")
vim.cmd("let g:loaded_perl_provider = 0")

for k, v in pairs(options) do
  vim.opt[k] = v
end
