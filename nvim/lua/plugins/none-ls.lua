return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.mdformat,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.opentofu_fmt,
      },
    })
    vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
