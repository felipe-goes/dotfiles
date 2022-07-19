local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  vim.notify("Missing ufo: ufo.lua")
  return
end

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = -1
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- option 2: nvim lsp as LSP client
-- tell the server the capability of foldingRange
-- nvim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local language_servers = {} -- like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require("lspconfig")[ls].setup({
    capabilities = capabilities,
    other_fields = ...,
  })
end

local ftMap = {
  vim = "indent",
  python = { "indent" },
  git = "",
}

ufo.setup({
  open_fold_hl_timeout = 150,
  preview = {
    win_config = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "Normal:Folded",
      winblend = 0,
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
    },
  },
  provider_selector = function(bufnr, filetype)
    -- return a string type use internal providers
    -- return a string in a table like a string type
    -- return empty string '' will disable any providers
    -- return `nil` will use default value {'lsp', 'indent'}

    -- if you prefer treesitter provider rather than lsp,
    -- return ftMap[filetype] or {'treesitter', 'indent'}
    return ftMap[filetype]
  end,
})

vim.keymap.set("n", "U", function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    -- nvimlsp
    vim.lsp.buf.hover()
  end
end)
