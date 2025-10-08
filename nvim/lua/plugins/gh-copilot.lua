return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    dependencies = {
      "MeanderingProgrammer/render-markdown.nvim",
    },
    opts = function()
      return {
        window = {
          layout = "float",
          width = 100,
          height = 0.9,
          border = "rounded",
          title = " 🤖 AI Assistant",
          zindex = 100,
          auto_insert_mode = true,
        },
        headers = {
          user = "👨‍💻 Steff",
          assistant = "🤖 AI Assistant",
          tool = "🔧 Tool",
        },
        temperature = 0.1,
        separator = "━━",
        auto_fold = true,
        auto_insert_mode = true,
      }
    end,
    keys = {
      { "<c-s>",     "<CR>", ft = "copilot-chat", remap = true },
      { "<leader>a", "",     mode = { "n", "v" } },
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        mode = { "n", "v" },
      },
      {
        "<leader>ax",
        function()
          return require("CopilotChat").reset()
        end,
        mode = { "n", "v" },
      },
      {
        "<leader>aq",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        mode = { "n", "v" },
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      local chat = require("CopilotChat")
      -- Auto-command to customize chat buffer behavior
      -- vim.api.nvim_create_autocmd("BufEnter", {
      --   pattern = "copilot-*",
      --   callback = function()
      --     vim.opt_local.relativenumber = false
      --     vim.opt_local.number = false
      --     vim.opt_local.conceallevel = 0
      --   end,
      -- })
      chat.setup(opts)
    end,
  },
}
