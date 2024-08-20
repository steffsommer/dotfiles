vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.api.nvim_set_keymap("n", "gd", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true })
    vim.opt.relativenumber = true
  end
})

-- this is not workign
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree" },
  callback = function()
    vim.opt.number = true
  end
})

