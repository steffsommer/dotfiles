vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.api.nvim_set_keymap("n", "gd", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true })
    vim.opt.number = true
    vim.opt.relativenumber = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function(opts)
    local keymap_opts = { buffer = opts.buf }
    vim.keymap.set("n", "<leader>rp", ":term go run .<CR>", keymap_opts)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  callback = function()
    vim.opt.relativenumber = false
  end,
})

local function toggle_test_file()
  local file_name = vim.fn.expand("%")
  print(file_name)
  local edit_target = ""
  if vim.endswith(file_name, "_test.go") then
    edit_target = string.gsub(file_name, "_test.go$", ".go")
  elseif vim.endswith(file_name, ".go") then
    edit_target = string.gsub(file_name, ".go$", "_test.go")
  end
  if vim.fn.filereadable(edit_target) == 1 then
    vim.cmd("e " .. edit_target)
  else
    print("File " .. edit_target .. " does not exist")
  end
end

vim.keymap.set("n", "<leader>gs", toggle_test_file)
