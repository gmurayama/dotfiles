local wezterm = require("wezterm")

local file_exists = function(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local merge = function(a, b)
	local c = {}
	for k, v in pairs(a) do
		c[k] = v
	end
	for k, v in pairs(b) do
		c[k] = v
	end
	return c
end

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

return {
	file_exists = file_exists,
	merge = merge,
	is_windows = is_windows,
}
