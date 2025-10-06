return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    cmd = "CopilotChat",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
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
      chat.setup(opts)
    end,
  },

}
