-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

--------------------------
-- custom functionality --
--------------------------

--- open a file with the same path, but a differnt extension if it exists
-- @param extension of the file to open without a preciding "."
function Open_sibling_file(extension)
  local absolute_path_no_extension = vim.fn.expand("%:p:r"):gsub(".spec", "")
  local absolute_path = absolute_path_no_extension .. "." .. extension

  if vim.fn.filereadable(absolute_path) == 1 then
    vim.cmd("edit " .. absolute_path)
  else
    print("Sibling file with extension " .. extension .. " does not exist")
  end
end
