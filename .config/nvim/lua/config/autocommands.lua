-- Intelligently reopens files at your last edit position
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = lastplace,
  pattern = { "*" },
  desc = "remember last cursor place",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Load project-specific Neovim configuration from .nvim.lua when entering a
-- buffer in the current directory
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local project_config = vim.fn.getcwd() .. "/.nvim.lua"
    if vim.fn.filereadable(project_config) == 1 then
      dofile(project_config)
    end
  end,
})

-- Make help open in a vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L | vert resize 90")
  end,
})

-- Set command for Neovim `make`
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt_local.makeprg = "cmake --build"
  end,
})

-- Set project based configuration for running the executable
vim.api.nvim_create_user_command("Run", function()
  local project_executable = vim.g.project_executable or "SfmlGame"
  local project_build_path = vim.g.project_build_path or "./build/release/"
  local exec = project_build_path .. project_executable
  vim.cmd("split | terminal " .. exec)
end, {})

-- Re-apply diagnostics config when command line mode is entered
vim.api.nvim_create_autocmd(
  { "CmdlineEnter", "InsertLeave", "BufEnter", "ModeChanged" },
  {
    callback = function()
      vim.diagnostic.config({
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })
    end,
    desc = "Ensure virtual_text stays off",
  }
)
