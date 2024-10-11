------------------------------------------------------------------
-------------------- Angular file switcher -----------------------
------------------------------------------------------------------

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
  if vim.fn.filereadable(sibling_path) == 0 then
    vim.ui.input({ prompt = sibling_path .. " does not exist. Do you want to create the file (y/n)?" }, function(input)
      print(input)
      if input == "y" then
        vim.cmd("e " .. sibling_path)
      end
    end)
  else
    vim.cmd("e " .. sibling_path)
  end
end

vim.keymap.set("n", "<leader>ah", function()
  angular_switch_sibling("html")
end)
vim.keymap.set("n", "<leader>at", function()
  angular_switch_sibling("ts")
end)
vim.keymap.set("n", "<leader>ac", function()
  angular_switch_sibling("scss")
end)
vim.keymap.set("n", "<leader>as", function()
  angular_switch_sibling("spec.ts")
end)

-- Display help in a vsplit
vim.api.nvim_create_user_command("H", function(args)
  vim.cmd("vert help " .. args.args)
end, {
  nargs = 1,
})

------------------------------------------------------------------
-------------------------- LSP stuff -----------------------------
------------------------------------------------------------------

-- Display LSP server capabilities
vim.api.nvim_create_user_command("Lcaps", function()
  local clients = vim.lsp.get_clients()
  local separator = "=========================================================="
  if clients == nil or #clients == 0 then
    print("No LSP connections")
    return
  end
  vim.cmd("vsplit")
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.opt_local.filetype = "lua"
  -- build content
  local summary = {}
  for _, client in ipairs(clients) do
    local capabilities = client.server_capabilities
    local capabilities_str = vim.inspect(capabilities)
    local capabilities_tbl = require("util/lua_extensions").split_string(capabilities_str, "\r\n")
    table.insert(summary, separator)
    table.insert(summary, client.name)
    table.insert(summary, separator)
    vim.list_extend(summary, capabilities_tbl)
  end
  -- local capabilities_tbl = split_newlines(capabilities_str)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, summary)
end, {})

