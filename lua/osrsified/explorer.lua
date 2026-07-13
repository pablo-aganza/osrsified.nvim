local M = {}

function M.get()
	return {
		layout = {
			layout = {
				width = 0.35,
				min_width = 30,
				max_width = 60,
				height = 0.67,
				min_height = 30,
				max_height = 70,
				row = -1,
				col = -1,
				border = "rounded",
				box = "vertical",
				{
					win = "input",
					height = 1,
					border = true,
					title = "{title}",
					title_pos = "center",
				},
				{ win = "list", border = "none" },
			},
		},
	}
end

return M
