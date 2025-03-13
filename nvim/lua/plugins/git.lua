return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {silent = true})
  end,
}
