return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ---@type lspconfig.options.tsserver
      ---@diagnostic disable-next-line: missing-fields
      svelte = {
        keys = {
          {
            "<leader>co",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Organize Imports",
          },
        },
      },
    },
  },
}
