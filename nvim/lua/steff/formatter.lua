

local clang_format_path = (require('mason-registry').get_package('clang-format'):get_install_path() .. '\\venv\\Scripts\\clang-format'):gsub("\\", "/")

require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.DEBUG,
  filetype = {
    java = {
      function()
        return {
          exe = clang_format_path,
          args = {"--style=Google", "--assume-filename=.java"},
          stdin = true
        }
      end
    }
  }
}

