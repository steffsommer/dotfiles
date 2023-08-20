
-- BUILT-IN --

vim.g.mapleader = ','

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set('n', '<leader>q', vim.cmd.q)
vim.keymap.set('n', '<leader>s', ':w<CR>')
vim.keymap.set('n', '<leader>S', ':wa<CR>')

-- single shortcut split navigation
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')

-- quick split resizing
local resizeColumns = 40
vim.keymap.set('n', '<C-W>+', ':vertical resize +' .. resizeColumns .. '<CR>')
vim.keymap.set('n', '<C-W>-', ':vertical resize -' .. resizeColumns .. '<CR>')

-- reload configuration
vim.keymap.set('n', '<leader>rc', ':so $MYVIMRC<CR>')

-- format current buffer
vim.keymap.set('n', '<leader>fo', ':Format<CRC>')

-- follow help file links
vim.keymap.set('n', 'ü', '<C-]>')


-- TELESCOPE --

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>cp', '<cmd>Telescope git_files<cr>')
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>gf', builtin.help_tags, {})


-- NEOTREE --

vim.keymap.set('n', '<leader>nt', ':Neotree filesystem toggle left<CR>', {})

-- LSP --

vim.keymap.set('i', 'C-<space>', vim.lsp.omnifunc, {})
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local M = {}

M.setupStandardLspKeybindings = function(opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

M.setupJdtlsLspKeybindings = function(opts)
  vim.keymap.set('n', '<A-o>', "<cmd>lua require('jdtls').organize_imports()<cr>", opts)
  vim.keymap.set('n', 'crv', "<cmd>lua require('jdtls').extract_variable()<cr>", opts)
  vim.keymap.set('x', 'crv', "<esc><cmd>lua require('jdtls').extract_variable(true)<cr>", opts)
  vim.keymap.set('n', 'crc', "<cmd>lua require('jdtls').extract_constant()<cr>", opts)
  vim.keymap.set('x', 'crc', "<esc><cmd>lua require('jdtls').extract_constant(true)<cr>", opts)
  vim.keymap.set('x', 'crm', "<esc><Cmd>lua require('jdtls').extract_method(true)<cr>", opts)
end

return M
