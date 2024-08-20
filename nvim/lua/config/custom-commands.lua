
-- Switch to a file of the same name/path with only a different extension
---@param extension string File extension of the sibling file without a "." prefix, e.g. "ts" or "scss"
local function angular_switch_sibling(extension)
  local patterns = { "spec%.ts$", "ts$", "html$", "scss$", "css$" }
  local sibling_path = vim.fn.expand("%")
  for _, pattern in ipairs(patterns) do
    sibling_path = string.gsub(sibling_path, pattern, extension)
  end
  print(sibling_path)
  vim.cmd("e " .. sibling_path)
end

vim.keymap.set("n", "<leader>ah", function() angular_switch_sibling("html") end)
vim.keymap.set("n", "<leader>at", function() angular_switch_sibling("ts") end)
vim.keymap.set("n", "<leader>ac", function() angular_switch_sibling("scss") end)
vim.keymap.set("n", "<leader>as", function() angular_switch_sibling("spec.ts") end)
