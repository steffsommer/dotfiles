return {
  {
    "projekt0n/github-nvim-theme",
    priority = 1000,
  },
  {
    "https://github.com/metalelf0/jellybeans-nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        palette = {
          main = { -- main or moon
            base = "#111111",
          },
        },
      })
    end,
  },
}
