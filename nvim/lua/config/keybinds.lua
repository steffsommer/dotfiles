
vim.api.nvim_set_keymap("n", "<C-g>", ":wa<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-g>", "<Esc>:wa<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ZQ", ":qa!<CR>", { noremap = true })

vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<C-m>", vim.diagnostic.goto_prev, {})

vim.api.nvim_set_keymap("n", "<leader>cn", ":cnext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cp", ":cprev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cq", ":cclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cc", ":cc<CR>", { noremap = true })

