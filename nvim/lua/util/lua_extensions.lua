
local M = {}

---Split a string at occurences of a separator. Supports control characters
---opposed to vim.split
---@param str string
---@param separator string
---@return table
function M.split_string(str, separator)
	local lines = {}
	for s in str:gmatch("[^" .. separator .. "]+") do
		table.insert(lines, s)
	end
	return lines
end

return M
