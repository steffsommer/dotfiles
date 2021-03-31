--    _____   _____________    ________  ___
--   /  _/ | / /  _/_  __/ |  / /  _/  |/  /
--   / //  |/ // /  / /  | | / // // /|_/ / 
-- _/ // /|  // /  / /   | |/ // // /  / /  
-- ___/_/ |_/___/ /_(_)  |___/___/_/  /_/   

-- author: somsky

-- +=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+ --
-- +=--------------------------=+ GENERAL SETTINGS +=--------------------------=+ --
-- +=--------------------------=+ ~~~~~~~~~~~~~~~~ +=--------------------------=+ --

-- window options
vim.wo.wrap           = false
vim.wo.scrolloff      = 5
vim.wo.sidescrolloff  = 15
vim.wo.number         = true
vim.wo.relativenumber = true

-- general options
vim.o.hlsearch    = false
vim.o.expandtab   = true
vim.o.tabstop     = 4
vim.o.shiftwidth  = 4
vim.o.smarttab    = true
vim.o.autoindent  = true
vim.o.smartindent = true
vim.o.splitright  = true
vim.o.splitbelow  = true
vim.o.swapfile    = false
vim.o.ignorecase  = true
vim.o.smartcase   = true
vim.o.incsearch   = true
vim.o.autoread    = true
vim.o.undofile    = true
vim.o.undodir     ='/tmp'
vim.o.mouse 	  = 'a'
vim.o.clipboard   = '+=a' -- use system clipboard

-- vim.api.nvim_exec([[autocmd FocusGained,BufEnter * :checktime]])

-- +=------------------------------=+ ~~~~~~~~ +=------------------------------=+"
-- =-------------------------------=+ KEY MAPS +=------------------------------=+"
-- +=------------------------------=+ ~~~~~~~~ +=------------------------------=+"

vim.g.mapleader = ','

vim.api.nvim_set_keymap('n', '<leader>s' , ':update<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })


vim.api.nvim_set_keymap('n', '<leader>+', ':vertical resize +20<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':vertical resize -20<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile ~/.config/nvim/init.lua<CR>', { noremap = true })

