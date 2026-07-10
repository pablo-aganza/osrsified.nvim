-- a start to some colors, will need to add more

local M = {}

M.palette = {
	-- backgrounds
	bg0 = "#0d0b08", -- deepest bg (editor)
	bg1 = "#1a1409", -- normal bg
	bg2 = "#261c0e", -- sidebars, floats
	bg3 = "#332513", -- selection, visual
	bg4 = "#4a3518", -- cursor line

	-- borders / ui elements
	border = "#7a5c2e", -- panel borders
	gold_dim = "#9c7a3a", -- inactive ui elements
	gold = "#e8c56a", -- keywords, highlights
	gold_bright = "#f5d87a", -- titles, active tab

	-- foregrounds
	fg0 = "#f0e8d0", -- primary text
	fg1 = "#d4c4a0", -- secondary text
	fg2 = "#a89060", -- muted / comments
	fg3 = "#7a6840", -- very muted

	-- orb colors
	hp_red = "#cc2200", -- health orb
	hp_red_bg = "#4a0a00",
	prayer_grn = "#3a8a3a", -- prayer orb
	prayer_bg = "#0a2a0a",
	run_blue = "#2a6aaa", -- run orb
	run_bg = "#0a1a3a",
	spec_purple = "#7a4aaa", -- special attack orb
	spec_bg = "#1e0a3a",

	-- syntax
	red = "#cc4422", -- errors
	orange = "#d4782a", -- numbers, booleans
	yellow = "#d4aa44", -- warnings
	green = "#4a9a4a", -- strings
	teal = "#3a8a7a", -- types, builtins
	blue = "#4a7aaa", -- functions
	purple = "#8a5aaa", -- special tokens

	-- git / diagnostics
	git_add = "#3a7a3a",
	git_change = "#7a6a2a",
	git_delete = "#8a2a2a",
	diag_error = "#cc4422",
	diag_warn = "#d4aa44",
	diag_info = "#4a7aaa",
	diag_hint = "#3a8a7a",

	none = "NONE",
}

return M
