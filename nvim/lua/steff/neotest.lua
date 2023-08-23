-- use neovim-vim-test adapter for all languages/tests

require("neotest").setup({
	log_level = vim.log.levels.TRACE,
	adapters = {
    require("neotest-java")
	},
})
