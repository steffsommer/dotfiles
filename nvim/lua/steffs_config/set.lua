vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
-- places } at the correct position in svelte files
vim.opt.cindent = true
vim.opt.smartindent = true
-- make help fullscreen
vim.opt.helpheight = 99999
vim.opt.wrap = false
vim.o.clipboard = "unnamedplus"
vim.opt.swapfile = false


vim.cmd("colorscheme OceanicNext")
