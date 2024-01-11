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

M.map = function(mode, key, result)
  vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end

M.load_module = function(module)
  local plenary = require('plenary.scandir')
  local config_path = vim.fn.stdpath("config")

  local files = plenary.scan_dir(config_path .. "/lua/" .. module)
  for _, file in ipairs(files) do
    local lua_file = string.match(file, "[^/]+%.lua$")
    if lua_file then
      local v = string.gsub(lua_file, "(.lua)", "")
      local file_name = module .. "." .. v
      local ok, _ = pcall(require, file_name)
      if not ok then
        print("unable to load the module " .. file_name)
      end
    end
  end
end

return M
