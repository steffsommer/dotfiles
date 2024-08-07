vim.g.mapleader        = " "

vim.opt.guicursor      = ""

vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.tabstop        = 2
vim.opt.shiftwidth     = 0
vim.opt.expandtab      = true
vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.ignorecase     = true
vim.opt.cmdheight      = 0
vim.o.splitright       = true
vim.o.splitbelow       = true
vim.o.signcolumn       = "yes" 

vim.opt.helpheight     = 99999

vim.opt.wrap           = false
vim.o.clipboard        = "unnamedplus"
vim.opt.swapfile       = false

vim.api.nvim_set_keymap("n", "<C-w>", ":update<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-J>", "<C-W><C-J>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-K>", "<C-W><C-K>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-L>", "<C-W><C-L>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-H>", "<C-W><C-H>", { noremap = true })

vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, {})
vim.keymap.set("n", "<C-m>", vim.diagnostic.goto_prev, {})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  callback = function()
    vim.api.nvim_set_keymap("n", "gd", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true })
    vim.opt.number = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree" },
  callback = function()
    vim.opt.number = true
  end
})

