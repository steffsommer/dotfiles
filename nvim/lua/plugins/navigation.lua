return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          aerial = {
            -- How to format the symbols
            format_symbol = function(symbol_path, filetype)
              if filetype == "json" or filetype == "yaml" then
                return table.concat(symbol_path, ".")
              else
                return symbol_path[#symbol_path]
              end
            end,
            -- Available modes: symbols, lines, both
            show_columns = "both",
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})

      telescope.load_extension("ui-select")
      vim.keymap.set("n", "<leader>ol", telescope.extensions.aerial.aerial)
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      vim.keymap.set("n", "<localleader>r", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<localleader>c", function()
        harpoon:list():clear()
      end)
      vim.keymap.set("n", "<localleader>t", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<localleader>a", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<localleader>s", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<localleader>d", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<localleader>f", function()
        harpoon:list():select(4)
      end)
      vim.keymap.set("n", "<localleader>l", function()
        harpoon:list():next()
      end)
      vim.keymap.set("n", "<localleader>k", function()
        harpoon:list():prev()
      end)
    end,
  },
}
