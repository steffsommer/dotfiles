return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "fredrikaverpil/neotest-golang"
      -- "rcasia/neotest-java",
      -- "weilbith/neotest-gradle",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        log_level = vim.log.levels.DEBUG,
        adapters = {
          -- require("neotest-gradle"),
          require("neotest-golang"),
          -- require("neotest-java")({
          --   ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
          --   junit_jar = nil,  -- default: .local/share/nvim/neotest-java/junit-platform-console-standalone-[version].jar
          -- }),
        },
        floating = {
          border = "rounded",
          max_height = 0.9,
          max_width = 0.9,
        },
      })
      vim.keymap.set("n", "<leader>nt", function()
        neotest.summary.toggle()
      end)
      vim.keymap.set("n", "<leader>tf", function()
        neotest.run.run(vim.fn.expand("%"))
      end)
      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run()
      end)
      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open()
      end)
    end,
  },
}
