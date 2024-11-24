local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Macros
keymap("n", "Q", "@q", opts)
keymap("x", "Q", ":norm @q<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +5<CR>", opts)
keymap("n", "<C-Down>", ":resize -5<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -5<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +5<CR>", opts)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Allow gf to open non-existent files
keymap("n", "gf", ":edit <cfile><cr>", opts)

-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap("v", "y", "myy`y", opts)
keymap("v", "Y", "myY`y", opts)

-- Make Y behave like the other capitals
keymap("n", "Y", "y$", opts)

-- Keep it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Easy insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<esc>A;<esc>", opts)
keymap("i", ",,", "<esc>A,<esc>", opts)

vim.cmd("cmap w!! %!sudo tee > /dev/null %")

-- Quickly insert an empty new line without entering insert mode
keymap("n", "<leader>o", "o<esc>", opts)
keymap("n", "<leader>O", "O<esc>", opts)

-- Clean search highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", opts)

-- Save and Exit
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>W", "<cmd>wa<cr>", opts)
keymap("n", "<leader>q", "<cmd>Bdelete!<cr>", opts)
keymap("n", "<leader>Q", "<cmd>q<cr>", opts)

-- Plugins
-- Gitsigns
vim.keymap.set("n", "[g", "<cmd>lua require'gitsigns'.prev_hunk()<cr>")
vim.keymap.set("n", "]g", "<cmd>lua require'gitsigns'.next_hunk()<cr>")

-- Harpoon
local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  vim.notify("Missing harpoon: keymaps.lua")
  return
end
vim.keymap.set("n", "<m-y>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<m-u>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<m-i>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<m-o>", function() harpoon:list():select(4) end)

-- toggle previous & next buffers stored within harpoon list
vim.keymap.set("n", "H", function() harpoon:list():prev() end)
vim.keymap.set("n", "L", function() harpoon:list():next() end)

harpoon:setup()

-- Lion
vim.cmd("let g:lion_squeeze_spaces = 1") -- Remove as many spaces as possible when aligning

-- Dap Debugger
keymap("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.toggle({}, 'vsplit')<CR><C-w>l", opts)
vim.keymap.set("n", "<leader>d?", function() local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes) end)
vim.keymap.set("n", "<C-A-k>", function() require'dap'.step_out() end)
vim.keymap.set("n", "<C-A-j>", function() require'dap'.step_into() end)
vim.keymap.set("n", "<C-A-l>", function() require'dap'.step_over() end)
vim.keymap.set("n", "<C-A-h>", function() require'dap'.continue() end)

-- follow-md-links
vim.keymap.set("n", "<bs>", ":edit #<cr>", { silent = true })
