local wezterm = require("wezterm")
local utils = require("utils")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 14.0
config.font = wezterm.font_with_fallback({
	"Fira Code",
})

config.color_scheme = "duskfox"
config.window_background_opacity = 0.96

config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

config.background = {
	{
		source = { Color = "#152535" },
		hsb = { brightness = 0.17 },
		height = "50%",
		width = "100%",
		-- opacity = 0.75,
	},
	{
		source = { Color = "#0c0d12" },
		hsb = { brightness = 0.17 },
		vertical_offset = "50%",
		height = "50%",
		width = "100%",
		-- opacity = 0.75,
	},
	{
		source = { File = wezterm.config_dir .. "/bg.jpg" },
		horizontal_align = "Center",
		vertical_align = "Middle",
		hsb = { brightness = 0.17 },
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		width = "100%",
		height = "Contain",
		-- opacity = 0.85,
	},
}

if utils.is_windows() then
	config.default_domain = "WSL:Arch"
end

-- Custom config
if utils.file_exists(wezterm.config_dir .. "/custom.lua") then
	local custom_config = require("custom")
	config = utils.merge(config, custom_config)
end

return config
