-- open a file with the same path, but a differnt extension if it exists
-- example:
--   current file is some_dir/test.ts
--   open_sibling_file("scss") opens some_dir/test.scss (if it exist)
function Open_sibling_file(extension)
  local absolute_path_no_extension = vim.fn.expand("%:p:r")
  local absolute_path = absolute_path_no_extension .. "." .. extension

  if vim.fn.filereadable(absolute_path) == 1 then
    vim.cmd("edit " .. absolute_path)
  else
    print("Sibling file with extension " .. extension .. " does not exist")
  end
end

function OpenTypescriptFile()
  Open_sibling_file("ts")
end

-- Bind the function to <leader>at
vim.keymap.set("n", "<leader>at", OpenTypescriptFile, { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>at", "<cmd>lua Open_sibling_file('ts')<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>lua Open_sibling_file(ts)<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>ah", "<cmd>lua Open_sibling_file(ts)<CR>", { noremap = true, silent = true })
--vim.api.nvim_set_keymap("n", "<leader>as", "<cmd>lua Open_sibling_file(ts)<CR>", { noremap = true, silent = true })
