return {
  -- {
  --   "vim-test/vim-test",
  --   setup = function()
  --     vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
  --     vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
  --   end
  -- }
  -- NeoTest is not usable at the moment. All the adapters I have looked at so far
  -- do not work properly in actual project settings
  -- {
  -- 	"weilbith/neotest-gradle",
  -- },
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
  {
    dir = "~/projects/neotest-gradle",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
      -- "rcasia/neotest-java",
      -- "weilbith/neotest-gradle",
    },
    config = function()
      vim.keymap.set("n", "<leader>nt", function()
        require("neotest").summary.toggle()
      end)
      vim.keymap.set("n", "<leader>tf", function()
        require("neotest").run.run(vim.fn.expand("%"))
      end)
      vim.keymap.set("n", "<leader>tt", function()
        require("neotest").run.run()
      end)
      vim.keymap.set("n", "<leader>to", function()
        require("neotest").output.open()
      end)
      ---@diagnostic disable: missing-fields
      require("neotest").setup({
        log_level = vim.log.levels.DEBUG,
        adapters = {
          -- require("neotest-gradle"),
          require("neotest-go"),
          -- require("neotest-java")({
          --   ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
          --   junit_jar = nil,  -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
          -- }),
        },
      })
    end,
  },
}
