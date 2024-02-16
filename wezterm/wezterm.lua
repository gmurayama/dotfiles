-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.font = wezterm.font_with_fallback({
	"Fira Code",
})

config.font_size = 14.0

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
	config.default_domain = "WSL:Arch"
	-- config.treat_left_ctrlalt_as_altgr = true
end

-- and finally, return the configuration to wezterm
return config
