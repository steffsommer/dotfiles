return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "filename", path=1 } },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "diff", "diagnostics" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

