local nnoremap = require("steffs_config.keymap").nnoremap
local git_worktree = require('telescope').extensions.git_worktree

------------------------
------------------------
-- Regular Remaps
------------------------
------------------------

vim.g.mapleader=" "

-- quick save
nnoremap("<leader>s", ":update<CR>")
nnoremap("<leader>S", ":wa<CR>")

-- Move between splits easier
nnoremap('<C-H>', '<C-W><C-H>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')

-- resize vertical splits
nnoremap('<leader>+', ':vertical resize +20<CR>')
nnoremap('<leader>-', ':vertical resize -20<CR>')

-- reload configuration
nnoremap('<leader>rc', ':so ~/.config/nvim/init.lua<CR>')

-----------------------
------------------------
-- PLUGIN REMAPS
------------------------
------------------------


------------------------
-- TELESCOPE --
------------------------

nnoremap("<leader>wt", git_worktree.git_worktrees)

nnoremap("<leader>cp", "<cmd>Telescope git_files<cr>")
nnoremap("<leader>af", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>lg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

------------------------
-- BARBAR --
------------------------

-- Move to previous/next
nnoremap('<S-TAB>', '<Cmd>BufferPrevious<CR>')
nnoremap('<TAB>', '<Cmd>BufferNext<CR>')
nnoremap('<leader>bd', '<Cmd>BufferClose<CR>')
-- Re-order to previous/next
-- nnoremap('<A-<>', '<Cmd>BufferMovePrevious<CR>')
-- nnoremap('<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
nnoremap('<leader>1', '<Cmd>BufferGoto 1<CR>')
nnoremap('<leader>2', '<Cmd>BufferGoto 2<CR>')
nnoremap('<leader>3', '<Cmd>BufferGoto 3<CR>')
nnoremap('<leader>4', '<Cmd>BufferGoto 4<CR>')
nnoremap('<leader>5', '<Cmd>BufferGoto 5<CR>')
nnoremap('<leader>6', '<Cmd>BufferGoto 6<CR>')
nnoremap('<leader>7', '<Cmd>BufferGoto 7<CR>')
nnoremap('<leader>8', '<Cmd>BufferGoto 8<CR>')
nnoremap('<leader>9', '<Cmd>BufferGoto 9<CR>')
nnoremap('<leader>0', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
-- nnoremap('<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
-- nnoremap('<C-p>', '<Cmd>BufferPick<CR>')

------------------------
-- NEOFORMAT --
------------------------

-- TODO; command: :Neoformat
nnoremap('<leader>ff', ':Neoformat<CR>')
