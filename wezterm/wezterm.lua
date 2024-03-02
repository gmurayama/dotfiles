local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "duskfox"
config.window_background_opacity = 0.96

config.font_size = 14.0
config.font = wezterm.font_with_fallback({
	"Fira Code",
})

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
	config.default_domain = "WSL:Arch"
end

return config
