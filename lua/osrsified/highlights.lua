local M = {}

function M.setup()
	local c = require("osrsified.colors").palette
	local hl = vim.api.nvim_set_hl

	-- base
	hl(0, "Normal", { fg = c.fg0, bg = c.bg1 })
	hl(0, "NormalFloat", { fg = c.fg0, bg = c.bg2 })
	hl(0, "CursorLine", { bg = c.bg4 })
	hl(0, "Visual", { bg = c.bg3 })
	hl(0, "LineNr", { fg = c.fg3 })
	hl(0, "CursorLineNr", { fg = c.gold })
	hl(0, "SignColumn", { bg = c.bg1 })
	hl(0, "ColorColumn", { bg = c.bg2 })
	hl(0, "VertSplit", { fg = c.border })

	-- syntax
	hl(0, "Comment", { fg = c.fg2, italic = true })
	hl(0, "Keyword", { fg = c.gold })
	hl(0, "Function", { fg = c.blue })
	hl(0, "String", { fg = c.green })
	hl(0, "Number", { fg = c.orange })
	hl(0, "Boolean", { fg = c.orange })
	hl(0, "Type", { fg = c.teal })
	hl(0, "Identifier", { fg = c.fg0 })
	hl(0, "Operator", { fg = c.gold_dim })
	hl(0, "Constant", { fg = c.orange })

	-- ui
	hl(0, "StatusLine", { fg = c.fg1, bg = c.bg2 })
	hl(0, "TabLine", { fg = c.fg2, bg = c.bg2 })
	hl(0, "TabLineSel", { fg = c.gold_bright, bg = c.bg1 })
	hl(0, "TabLineFill", { bg = c.bg2 })
	hl(0, "Pmenu", { fg = c.fg0, bg = c.bg2 })
	hl(0, "PmenuSel", { fg = c.gold, bg = c.bg3 })
end

return M
