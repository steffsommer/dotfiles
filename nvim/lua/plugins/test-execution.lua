return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "fredrikaverpil/neotest-golang",
      -- "rcasia/neotest-java",
      -- "weilbith/neotest-gradle",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        log_level = vim.log.levels.DEBUG,
        adapters = {
          require("neotest-golang")({
            go_test_args = { "-v", "-race", "-tags=slowtest unittest" },
            dap_go_opts = {
              delve = {
                build_flags = { "-tags=slowtest unittest" },
              },
            },
          }),
        },
        floating = {
          border = "rounded",
          max_height = 0.9,
          max_width = 0.9,
        },
        quickfix = {
          enabled = false,
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
      vim.keymap.set("n", "<leader>dd", function()
        neotest.run.run({ strategy = "dap" })
      end)
      vim.keymap.set("n", "<leader>to", function()
        neotest.output.open({enter = true})
      end)
    end,
  },
}
