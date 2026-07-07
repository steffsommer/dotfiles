-- return {
--   "nvim-treesitter/nvim-treesitter",
--   build = ":TSUpdate",
--   config = function()
--     local config = require("nvim-treesitter.configs")
--     config.setup({
--       auto_install = true,
--       highlight = { enable = true },
--       indent = { enable = true },
--       ensure_installed = {
--         "bash",
--         "c",
--         "diff",
--         "go",
--         "html",
--         "javascript",
--         "jsdoc",
--         "json",
--         "jsonc",
--         "lua",
--         "luadoc",
--         "luap",
--         "markdown",
--         "markdown_inline",
--         "python",
--         "regex",
--         "toml",
--         "typescript",
--         "vim",
--         "vimdoc",
--         "xml",
--         "yaml",
--       },
--     })
--   end,
-- }

-- return {
--   'nvim-treesitter/nvim-treesitter',
--   dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
--   lazy = false,
--   build = ':TSUpdate',
-- }

return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
      -- Default Options
      parser_dir = vim.fn.stdpath("data") .. "/site/parser",
      query_dir = vim.fn.stdpath("data") .. "/site/queries",
      assume_installed = {}, -- blacklist languages
      ensure_installed = {}, -- parsers to install at startup
      auto_install = true, -- auto-install when a new filetype is encountered
      noauto_install = {}, -- blacklist from auto_install
      highlight = true, -- enable treesitter highlighting (use list to whitelist)
      nohighlight = {}, -- blacklist from highlight
      languages = {}, -- override or add new parser sources
      nerdfont = true, -- use Nerd Font icons in the manager UI
      border = "rounded", -- border style for the TUI window
      min_width = 78, -- minimum size of the TUI
      min_height = 40,
    })
  end,
}
