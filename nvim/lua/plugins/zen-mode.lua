return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    local zen_mode = require("zen-mode")
    vim.keymap.set("n", "<leader>z", zen_mode.toggle, { noremap = true })
  end,
}

