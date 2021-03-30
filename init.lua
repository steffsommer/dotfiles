--    _____   _____________    ________  ___
--   /  _/ | / /  _/_  __/ |  / /  _/  |/  /
--   / //  |/ // /  / /  | | / // // /|_/ / 
-- _/ // /|  // /  / /   | |/ // // /  / /  
-- ___/_/ |_/___/ /_(_)  |___/___/_/  /_/   

-- author: somsky

-- +=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+ --
-- +=--------------------------=+ GENERAL SETTINGS +=--------------------------=+ --
-- +=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+ --

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.hlsearch = false
vim.o.scrolloff=5
vim.o.sidescrolloff=15
vim.o.expandtab = true
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.smarttab = true
vim.o.wrap = false
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.swapfile = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.autoread = true
vim.o.undofile = true
vim.o.undodir='/tmp'
vim.o.mouse = 'a'

-- ~~~~~~~~ +=------------------------------=+"
-- =------------------------------=+ KEY MAPS +=------------------------------=+"
-- +=------------------------------=+ ~~~~~~~~ +=------------------------------=+"

vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

vim.g.mapleader = ','

