vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.cmdheight = 0
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true

vim.opt.helpheight = 99999
vim.o.wildignore = "node_modules/*"

vim.opt.wrap = false
vim.o.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.o.shellcmdflag = "-ic"

-- Fix clipboard in WSL
local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
if in_wsl then
  vim.g.clipboard = {
    name = "wsl clipboard",
    copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
    paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
    cache_enabled = true,
  }
end
