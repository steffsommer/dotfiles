vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.api.nvim_set_keymap("n", "gd", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true })
    vim.opt.number = true
    vim.opt.relativenumber = true
  end
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go" },
  callback = function(opts)
		local keymap_opts = { buffer = opts.buffer }
    vim.keymap.set("n", "<leader>rp", ":term go run .<CR>", keymap_opts)
  end
})
