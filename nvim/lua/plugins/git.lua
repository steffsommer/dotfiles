return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gb', ':Git blame --date=short<CR>', {silent = true})
  end,
}
