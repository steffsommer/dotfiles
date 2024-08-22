-- Switch to a file of the same name/path with only a different extension
---@param extension string File extension of the sibling file without a "." prefix, e.g. "ts" or "scss"
local function angular_switch_sibling(extension)
  local patterns = { "spec%.ts$", "ts$", "html$", "scss$", "css$" }
  local sibling_path = vim.fn.expand("%")
  if sibling_path == nil then
    return
  end
  for _, pattern in ipairs(patterns) do
    sibling_path = string.gsub(sibling_path, pattern, extension)
  end
  if (vim.fn.filereadable(sibling_path) == 0) then
    vim.ui.input(
      { prompt = sibling_path .. " does not exist. Do you want to create the file (y/n)?" },
      function(input)
        print(input)
        if (input == 'y') then
          vim.cmd("e " .. sibling_path)
        end
      end
    )
  else
    vim.cmd("e " .. sibling_path)
  end
end

vim.keymap.set("n", "<leader>ah", function() angular_switch_sibling("html") end)
vim.keymap.set("n", "<leader>at", function() angular_switch_sibling("ts") end)
vim.keymap.set("n", "<leader>ac", function() angular_switch_sibling("scss") end)
vim.keymap.set("n", "<leader>as", function() angular_switch_sibling("spec.ts") end)
