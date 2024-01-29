-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
--vim.keymap.set('n', '<leader>q', vim.cmd.q)
--vim.keymap.set('n', '<leader>s', ':w<CR>')
--vim.keymap.set('n', '<leader>S', ':wa<CR>')

-- quick split resizing
--local resizeColumns = 40
--vim.keymap.set('n', '<C-W>+', ':vertical resize +' .. resizeColumns .. '<CR>')
--vim.keymap.set('n', '<C-W>-', ':vertical resize -' .. resizeColumns .. '<CR>')

-- reload configuration
--vim.keymap.set("n", "<leader>rc", ":so $MYVIMRC<CR>")

-- format current buffer
--vim.keymap.set("n", "<leader>fo", ":Format<CRC>")

-- follow help file links
vim.keymap.set("n", "ü", "<C-]>")

-- TELESCOPE --

--local builtin = require("telescope.builtin")
--vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
--vim.keymap.set("n", "<leader>cp", "<cmd>Telescope git_files<cr>")
--vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
--vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
--vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
--vim.keymap.set("n", "<leader>gf", builtin.help_tags, {})

-- NEOTREE --
--vim.keymap.set("n", "<leader>nt", ":Neotree filesystem toggle left<CR>", {})

-- LSP --
--vim.keymap.set("i", "C-<space>", vim.lsp.omnifunc, {})
--vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
--vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev)
--vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next)
--vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- run nearest test
--vim.keymap.set('<leader>tm', '<A-o>',neotest_runner.run())

-- debug nearest test
--vim.keymap.set('<leader>dt', '<A-o>', "<cmd>lua require('neotest').run.run({strategy = 'dap'}<cr>")

-- stop nearest test
--vim.keymap.set('<leader>tm', '<A-o>', "<cmd>lua require('neotest').run.stop()<cr>")

-- run current file
--vim.keymap.set('<leader>tf', '<A-o>', "<cmd>lua require('neotest').run.run(vim.fn.expand("%"))<cr>")

vim.keymap.set("n", "<leader>at", function()
  Open_sibling_file("ts")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ah", function()
  Open_sibling_file("html")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ac", function()
  Open_sibling_file("scss")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>as", function()
  Open_sibling_file("spec.ts")
end, { noremap = true, silent = true })
