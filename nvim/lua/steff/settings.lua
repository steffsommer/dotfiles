vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

-- places } at the correct position in svelte files
-- vim.opt.smartindent = true

-- make help fullscreen
vim.opt.helpheight = 99999

vim.opt.wrap = false
vim.o.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- Display line numbers in help files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help" },
  command = ":set number",
 })

vim.cmd("colorscheme gruvbox-material")
--vim.g.gruvbox_material_foreground = 'original' -- material, mix or original
