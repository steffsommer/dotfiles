-- setup lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("config.vim-options")
require("config.autocmds")
require("config.custom-commands")

require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	ui = {
		border = "rounded",
	},
})
vim.cmd("colorscheme citruszest")
