-- Setup language servers.
local lspconfig = require("lspconfig")

lspconfig.awk_ls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.arduino_language_server.setup({})
lspconfig.asm_lsp.setup({})
lspconfig.bashls.setup({})
lspconfig.clangd.setup({})
lspconfig.omnisharp.setup({})
lspconfig.cmake.setup({})
lspconfig.cssls.setup({})
lspconfig.dockerls.setup({})
lspconfig.docker_compose_language_service.setup({})
lspconfig.gopls.setup({})
lspconfig.jsonls.setup({})
lspconfig.jdtls.setup({})
lspconfig.tsserver.setup({})
lspconfig.kotlin_language_server.setup({})
lspconfig.lua_ls.setup({})
lspconfig.autotools_ls.setup({})
lspconfig.markdown_oxide.setup({})
lspconfig.matlab_ls.setup({})
lspconfig.intelephense.setup({})
lspconfig.powershell_es.setup({})
lspconfig.pyright.setup({})
lspconfig.pylsp.setup({})
lspconfig.sqls.setup({})
lspconfig.lemminx.setup({})
lspconfig.gitlab_ci_ls.setup({})
-- lspconfig.rust_analyzer.setup {
--   Server-specific settings. See `:help lspconfig-setup`
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

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
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    -- Commented so it does not conflict with command `Telescope find_files`
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
