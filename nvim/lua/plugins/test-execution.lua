return {
  {
    "vim-test/vim-test",
    setup = function()
      vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
      vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
    end
  }
  -- NeoTest is not usable at the moment. All the adapters I have looked at so far
  -- do not work properly in actual project settings
  --
	-- {
	-- 	"rcasia/neotest-java",
	-- 	init = function()
	-- 		local function run_test_suite()
	-- 			require("neotest").run.run(vim.fn.expand("%"))
	-- 		end
	--
	-- 		vim.keymap.set("n", "<leader>tt", run_test_suite)
	-- 	end,
	-- 	build = function()
	-- 		vim.cmd("NeotestJava setup")
	-- 	end,
	-- },
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	dependencies = {
	-- 		"nvim-neotest/nvim-nio",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"antoinemadec/FixCursorHold.nvim",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"rcasia/neotest-java",
	-- 	},
	-- 	config = function()
 --      vim.keymap.set("n", "<leader>nt", function() require("neotest").summary.toggle() end)
	-- 		---@diagnostic disable: missing-fields
	-- 		require("neotest").setup({
 --        log_level = vim.log.levels.DEBUG,
	-- 			adapters = {
	-- 				require("neotest-java")({
	-- 					ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
	-- 					junit_jar = nil, -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
	-- 				}),
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
