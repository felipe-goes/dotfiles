return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },

    -- example using `opts` for defining servers
    opts = {
      servers = {
        lua_ls = {},
        bashls = {},
        clangd = {},
        cmake = {},
        cssls = {},
        dockerls = {},
        docker_compose_language_service = {},
        gopls = {},
        html = {},
        jsonls = {},
        markdown_oxide = {},
        matlab_ls = {},
        omnisharp = {},
        powershell_es = {},
        pyright = {},
        ts_ls = {},
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      local default_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities(default_capabilities)
      local lspconfig = require("lspconfig")

      lspconfig["lua_ls"].setup({ capabilities = capabilities })
      lspconfig["bashls"].setup({ capabilities = capabilities })
      lspconfig["clangd"].setup({ capabilities = capabilities })
      lspconfig["cmake"].setup({ capabilities = capabilities })
      lspconfig["cssls"].setup({ capabilities = capabilities })
      lspconfig["dockerls"].setup({ capabilities = capabilities })
      lspconfig["docker_compose_language_service"].setup({ capabilities = capabilities })
      lspconfig["gopls"].setup({ capabilities = capabilities })
      lspconfig["html"].setup({ capabilities = capabilities })
      lspconfig["jsonls"].setup({ capabilities = capabilities })
      lspconfig["markdown_oxide"].setup({ capabilities = capabilities })
      lspconfig["matlab_ls"].setup({ capabilities = capabilities })
      lspconfig["omnisharp"].setup({ capabilities = capabilities })
      lspconfig["powershell_es"].setup({ capabilities = capabilities })
      lspconfig["pyright"].setup({ capabilities = capabilities })
      lspconfig["ts_ls"].setup({ capabilities = capabilities })

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
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    config = function()
      null_ls = require("null-ls")

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      local formatting = null_ls.builtins.formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      local diagnostics = null_ls.builtins.diagnostics
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
      -- local completion = null_ls.builtins.completion
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
      -- local code_actions = null_ls.builtins.code_actions
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
      -- local hover = null_ls.builtins.hover

      null_ls.setup({
        sources = {
          -- Formatting
          -- angular, css, flow, graphql, html, json, jsx, javascript, less, markdown,
          -- scss, typescript, vue, yaml
          formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
          -- bash
          formatting.shfmt,
          -- c, c++
          formatting.clang_format,
          -- lua
          formatting.stylua.with({ extra_args = { "--indent-type", "Spaces", "--indent-width", "2" } }),
          -- python
          formatting.black.with({ extra_args = { "--fast" } }),
          formatting.isort,

          -- Linting
          -- bash
          require("none-ls-shellcheck.diagnostics"),
          -- cpp
          require("none-ls.diagnostics.cpplint"),
          -- go
          diagnostics.staticcheck,
          -- html
          diagnostics.markuplint,
          -- lua
          -- diagnostics.selene,
          -- python
          require("none-ls.diagnostics.flake8"),
          -- typescript, javascript
          require("none-ls.diagnostics.eslint_d"),
          -- yaml
          diagnostics.yamllint,
        },
      })
    end,
  }, -- for formatters and linters
  -- "tamago324/nlsp-settings.nvim", -- language server settings defined in json
  "nvimtools/none-ls-extras.nvim",
  "gbprod/none-ls-shellcheck.nvim",
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    config = function()
      local guihua = require("guihua")
      local go = require("go")

      -- default mapping
      local maps = {
        close_view = "<C-e>",
        send_qf = "<C-q>",
        save = "<C-s>",
        jump_to_list = "<C-w>k",
        jump_to_preview = "<C-w>j",
        prev = "<C-p>",
        next = "<C-n>",
        pageup = "<C-b>",
        pagedown = "<C-f>",
        confirm = "<C-o>",
        split = "<C-s>",
        vsplit = "<C-v>",
        tabnew = "<C-t>",
      }

      -- default icons for panel
      -- will be tbl_deep_extend() if you override any of those
      local icons = {
        panel_icons = {
          section_separator = "─", --'',
          line_num_left = ":", --'',
          line_num_right = "", --',

          range_left = "", --'',
          range_right = "",
          inner_node = "", --├○',
          folded = "◉",
          unfolded = "○",

          outer_node = "", -- '╰○',
          bracket_left = "", -- ⟪',
          bracket_right = "", -- '⟫',
        },
        syntax_icons = {
          var = " ", -- "👹", -- Vampaire
          method = "ƒ ", --  "🍔", -- mac
          ["function"] = " ", -- "🤣", -- Fun
          ["arrow_function"] = " ", -- "🤣", -- Fun
          parameter = "", -- Pi
          associated = "🤝",
          namespace = "🚀",
          type = " ",
          field = "🏈",
          interface = "",
          module = "📦",
          flag = "🎏",
        },
      }

      guihua.setup({
        maps = maps,
        icons = icons,
      })

      go.setup()
    end,
  },
}
