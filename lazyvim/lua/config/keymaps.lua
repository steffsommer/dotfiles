-- Keyvim.keymap.sets are automatically loaded on the VeryLazy event
-- Default keyvim.keymap.sets that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keyvim.keymap.sets here

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

-- revim.keymap.set commands starting with "[" or "]" to "ü" and "+" (german equivalent of US keyboard layout)

vim.keymap.set("n", "üd", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "+d", diagnostic_goto(false), { desc = "Prev Diagnostic" })

vim.keymap.set("n", "üe", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "+e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })

vim.keymap.set("n", "üw", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "+w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
