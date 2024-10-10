-- Setup language servers.
local lspconfig = require("lspconfig")
local clangd_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities()

clangd_capabilities.offsetEncoding = { "utf-16" }

lspconfig.bashls.setup({
  capabilities = capabilities
})
lspconfig.clangd.setup({
  capabilities = clangd_capabilities
})
lspconfig.cmake.setup({
  capabilities = capabilities
})
lspconfig.cssls.setup({
  capabilities = capabilities
})
lspconfig.dockerls.setup({
  capabilities = capabilities
})
lspconfig.docker_compose_language_service.setup({
  capabilities = capabilities
})
lspconfig.gopls.setup({
  capabilities = capabilities
})
lspconfig.html.setup({
  capabilities = capabilities
})
lspconfig.jsonls.setup({
  capabilities = capabilities
})
lspconfig.lua_ls.setup({
  capabilities = capabilities
})
lspconfig.markdown_oxide.setup({
  capabilities = capabilities
})
lspconfig.matlab_ls.setup({
  capabilities = capabilities
})
lspconfig.powershell_es.setup({
  capabilities = capabilities
})
lspconfig.pyright.setup({
  capabilities = capabilities
})
lspconfig.ts_ls.setup({
  capabilities = capabilities
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float) -- check whichkey
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist) -- check whichkey
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", "<cmd>Trouble lsp_definitions<cr>", opts) -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", "<cmd>Trouble lsp_references<cr>", opts) -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- The commands below need to be reassigned if you want to use
    -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts) -- check whichkey
    -- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts) -- check whichkey
    -- vim.keymap.set("n", "<space>wl", function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts) -- check whichkey
    -- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts) -- check whichkey
    -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts) -- check whichkey
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true } -- check whichkey
    -- end, opts)
  end,
})
