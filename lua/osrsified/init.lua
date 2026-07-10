local M = {}

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "osrsified"

	require("osrsified.highlights").setup()
end

return M
