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

local function merge(a, b)
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

local function ends_with(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end

local TargetPlatform = {
	Windows = {},
	Linux = {},
	Mac = {},
	Unknown = {},
}

local function current_target()
	if ends_with(wezterm.target_triple, "windows-msvc") then
		if wezterm.running_under_wsl() then
			return TargetPlatform.Linux
		end
		return TargetPlatform.Windows
	elseif ends_with(wezterm.target_triple, "apple-darwin") then
		return TargetPlatform.Mac
	elseif ends_with(wezterm.target_triple, "linux-gnu") then
		return TargetPlatform.Linux
	end

	return TargetPlatform.Unknown
end

return {
	file_exists = file_exists,
	merge = merge,
	is_windows = is_windows,
	ends_with = ends_with,
	current_target = current_target,

	TargetPlatform = TargetPlatform,
}
