return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = { -- this does not work
        "java-debug-adapter",
        "java-test",
      },
    },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          height = 0.8,
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      automatic_enable = false, -- very important to avoid duplicate LSP servers since nvim 0.11
      ensure_installed = {
        "angularls",
        "bashls",
        "eslint",
        "html",
        "jdtls",
        "lua_ls",
        "svelte",
        "ts_ls",
        "gopls",
        "sqlls",
      },
      handlers = {
        ["angularls"] = function()
          local lspconfig = require("lspconfig")
          local capabilities = require("cmp_nvim_lsp").default_capabilities()
          local util = require("lspconfig.util")
          lspconfig.angularls.setup({
            capabilities = capabilities,
            root_dir = util.root_pattern("angular.json", "project.json"),
          })
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      capabilities = {
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local util = require("lspconfig.util")
      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.angularls.setup({
        capabilities = capabilities,
        root_dir = util.root_pattern("angular.json", "project.json"),
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.terraformls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            buildFlags = { "-tags=slowtest unittest" },
          },
        },
      })
      lspconfig.protols.setup({
        capabilities = capabilities,
      })
      lspconfig.sqlls.setup({
        capabilities = capabilities,
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
        callback = function(ev)
          require("util/lsp").setup_default_keybindings(ev)
        end,
      })

      -- make LSP windows bordered
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
}
