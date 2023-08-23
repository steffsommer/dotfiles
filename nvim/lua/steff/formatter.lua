local mason_registry = require("mason-registry")
local clang_format_path = (
	mason_registry.get_package("clang-format"):get_install_path() .. "\\venv\\Scripts\\clang-format"
):gsub("\\", "/")
local stylua_path = (mason_registry.get_package("stylua"):get_install_path() .. "/stylua"):gsub("\\", "/")
local formatter_util = require("formatter.util")

-- TODO: Extract exe location, so the path has not to be built custom like with clang-format
-- Potentially the nvim-data/mason/bin shell scripts can be used
-- print(mason_registry.get_package("stylua").spec.bin)

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.DEBUG,
	filetype = {
		java = {
			function()
				return {
					exe = clang_format_path,
					args = { "--style=Google", "--assume-filename=.java" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = stylua_path,
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						formatter_util.escape_path(formatter_util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
})
