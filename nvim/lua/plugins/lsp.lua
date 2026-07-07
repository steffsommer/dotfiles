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
    "mason-org/mason-lspconfig.nvim",
      opts = {
        auto_install = true,
        automatic_enable = true,
        ensure_installed = {
          "angularls",
          "bashls",
          "eslint",
          "html",
          "lua_ls",
          "svelte",
          "ts_ls",
          "gopls",
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
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
