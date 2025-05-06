local wezterm = require("wezterm")

-- maximize on startup
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	-- Font settings
	--[[[font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		"Fira Code",
		"Menlo",
	}), ]]
	font_size = 20.0,

	-- Window styling
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	window_decorations = "RESIZE", -- Use "NONE" for no title bar
	window_background_opacity = 0.95,

	-- Appearance
	color_scheme = wezterm.gui.get_appearance():find("Dark") and "Catppuccin Mocha" or "Catppuccin Latte",

	-- Tab bar
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,

	-- Scrollback
	scrollback_lines = 5000,

	-- MacOS specific
	macos_window_background_blur = 20,

	-- Startup behavior
	default_prog = { "/bin/zsh", "-l" }, -- Or change to your shell
}
