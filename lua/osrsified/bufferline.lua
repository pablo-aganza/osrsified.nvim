local M = {}

function M.get()
	local c = require("osrsified.colors").palette
	local utils = require("heirline.utils")

	local TablineBuffer = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(self.bufnr)
		end,
		hl = function(self)
			if self.is_active then
				return { fg = c.bg0, bg = c.gold_bright, bold = true }
			end
			return { fg = c.fg2, bg = c.bg2 }
		end,
		on_click = {
			minwid = function(self)
				return self.bufnr
			end,
			callback = function(_, minwid)
				vim.api.nvim_set_current_buf(minwid)
			end,
			name = "osrsified_tabline_buffer_click",
		},
		{
			provider = function(self)
				local name = vim.fn.fnamemodify(self.filename, ":t")
				return " " .. (name ~= "" and name or "[No Name]") .. " "
			end,
		},
		{
			condition = function(self)
				return vim.bo[self.bufnr].modified
			end,
			provider = "* ",
			hl = { fg = c.hp_red },
		},
	}

	local function listed_bufs()
		return vim.tbl_filter(function(bufnr)
			return vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted
		end, vim.api.nvim_list_bufs())
	end

	vim.t.bufs = listed_bufs()
	vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "BufDelete" }, {
		callback = function()
			vim.t.bufs = listed_bufs()
		end,
	})

	local Bufferline = utils.make_buflist(
		TablineBuffer,
		{ provider = " ", hl = { fg = c.gold_dim, bg = c.bg2 } },
		{ provider = " ", hl = { fg = c.gold_dim, bg = c.bg2 } },
		function()
			return vim.t.bufs or {}
		end
	)

	vim.o.showtabline = 2

	return { Bufferline }
end

return M
