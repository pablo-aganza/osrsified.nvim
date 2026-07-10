local M = {}

function M.get()
	local c = require("osrsified.colors").palette

	local mode_names = {
		["n"] = "NORMAL",
		["i"] = "INSERT",
		["v"] = "VISUAL",
		["V"] = "V-LINE",
		["\22"] = "V-BLOCK",
		["c"] = "COMMAND",
		["R"] = "REPLACE",
		["t"] = "TERMINAL",
	}

	local mode_colors = {
		["n"] = c.gold,
		["i"] = c.prayer_grn,
		["v"] = c.run_blue,
		["V"] = c.run_blue,
		["c"] = c.spec_purple,
		["R"] = c.hp_red,
		["t"] = c.hp_red,
	}

	local Mode = {
		provider = function()
			local m = vim.fn.mode()
			return " " .. (mode_names[m] or m) .. " "
		end,
		hl = function()
			local m = vim.fn.mode()
			return { fg = c.bg0, bg = mode_colors[m] or c.gold, bold = true }
		end,
	}

	local function tab(label, value_fn, color_fn)
		return {
			{
				provider = " " .. label .. " ",
				hl = { fg = c.gold_dim, bg = c.bg2 },
			},
			{
				provider = function()
					return value_fn() .. " "
				end,
				hl = function()
					return { fg = color_fn(), bg = c.bg2, bold = true }
				end,
			},
		}
	end

	local function git_head()
		local head = vim.b.gitsigns_head or vim.g.gitsigns_head
		if not head or head == "" then
			return nil
		end
		return head
	end

	local Git = tab("GAME", function()
		return git_head() or "Off"
	end, function()
		return git_head() and c.prayer_grn or c.hp_red
	end)

	local Diagnostics = tab("PUBLIC", function()
		local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		if errors > 0 then
			return "Error(" .. errors .. ")"
		end
		if warns > 0 then
			return "Warn(" .. warns .. ")"
		end
		return "On"
	end, function()
		local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		local warns = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		if errors > 0 then
			return c.hp_red
		end
		if warns > 0 then
			return c.diag_warn
		end
		return c.prayer_grn
	end)

	local Ruler = {
		provider = " %l:%c ",
		hl = { fg = c.fg0, bg = c.hp_red_bg, bold = true },
	}

	local Align = { provider = "%=" }

	return { Mode, Git, Diagnostics, Align, Ruler }
end

return M
