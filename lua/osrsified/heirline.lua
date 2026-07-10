local M = {}

function M.setup()
	local heirline = require("heirline")

	heirline.setup({
		statusline = require("osrsified.statusline").get(),
		tabline = require("osrsified.bufferline").get(),
	})

	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "*:*",
		callback = function()
			vim.cmd("redrawstatus")
		end,
	})
end

return M
