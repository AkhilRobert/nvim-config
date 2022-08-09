local M = {}

-- Checks whether the file is present in the current working directory
M.file_exists_cwd = function(filename)
	local path = vim.fn.getcwd() .. "/" .. filename
	local f = io.open(path, 'r')
	if f == nil then
		return false
	end
	f:close()
	return true
end

return M
