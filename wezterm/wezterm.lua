local wezterm = require("wezterm")
local utils = require("utils")
local utf8 = require("utf8")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font_size = 14.0
config.font = wezterm.font_with_fallback({
	"Fira Code",
})

config.color_scheme = "Adventure"

config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.use_fancy_tab_bar = false
config.tab_max_width = 20

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

config.keys = {
	{
		key = "?",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = ">",
		mods = "CTRL|SHIFT|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "H",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-background"),
	},
}

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("toggle-background", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	local next = next
	if overrides.background and next(overrides.background) == nil then
		overrides.background = {
			{
				source = { Color = "#152535" },
				hsb = { brightness = 0.17 },
				height = "50%",
				width = "100%",
			},
			{
				source = { Color = "#0c0d12" },
				hsb = { brightness = 0.17 },
				vertical_offset = "50%",
				height = "50%",
				width = "100%",
			},
			{
				source = { File = wezterm.config_dir .. "\\bg.jpg" },
				horizontal_align = "Center",
				vertical_align = "Middle",
				hsb = { brightness = 0.17 },
				repeat_x = "NoRepeat",
				repeat_y = "NoRepeat",
				width = "100%",
				height = "Contain",
			},
		}
	else
		overrides.background = {}
	end
	print(overrides)
	window:set_config_overrides(overrides)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
	local background = "#65737E"
	local foreground = "#F0F2F5"
	local edge_background = "#333333"

	if tab.is_active or hover then
		background = "#E5C07B"
		foreground = "#282C34"
	end
	local edge_foreground = background

	local process_name = tab.active_pane.foreground_process_name
	local exec_name = basename(process_name):gsub("%.exe$", "")
	local panel_title = tab.active_pane.title:gsub("%.exe$", "")

	local icon
	if exec_name == "wsl" or exec_name == "wslhost" then
		icon = utf8.char(0xf17c)
	else
		icon = utf8.char(0xf17a)
	end

	local title = icon .. " " .. panel_title

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	local max = config.tab_max_width - 4
	if #title > max then
		title = wezterm.truncate_right(title, max) .. "…"
	end

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = " " },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } },
		{ Text = "" .. title .. "" },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = "" },
	}
end)

if utils.is_windows() then
	config.default_domain = "WSL:Arch"
	config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l" }

	table.insert(config.keys, {
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab({
			DomainName = "local",
		}),
	})
end

-- Custom config
if utils.file_exists(wezterm.config_dir .. "/custom.lua") then
	local custom_config = require("custom")
	config = utils.merge(config, custom_config)
end

return config
