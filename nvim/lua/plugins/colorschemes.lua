return {
	{
		"zootedb0t/citruszest.nvim",
		priority = 1000,
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				theme = {
					variant = "light",
				},
			})
		end,
	},
}
