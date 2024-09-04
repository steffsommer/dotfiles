return {
  "ray-x/go.nvim",
  dependencies = { -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear=false }),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        local go_format = require("go.format")
        vim.keymap.set("n", "<leader>ff", go_format.gofmt, opts)
        vim.keymap.set("n", "<leader>co", go_format.goimports, opts)
      end,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", 'gomod' },
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
