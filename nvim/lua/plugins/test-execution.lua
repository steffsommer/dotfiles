return {
	{
		"rcasia/neotest-java",
		init = function()
			local function run_test_suite()
				require("neotest").run.run(vim.fn.expand("%"))
			end

			vim.keymap.set("n", "<leader>tt", run_test_suite)
		end,
		build = function()
			vim.cmd("NeotestJava setup")
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcasia/neotest-java",
		},
		config = function()
      vim.keymap.set("n", "<leader>nt", function() require("neotest").summary.toggle() end)
			---@diagnostic disable: missing-fields
			require("neotest").setup({
				adapters = {
					require("neotest-java")({
						ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
						junit_jar = nil, -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
					}),
				},
			})
		end,
	},
}
