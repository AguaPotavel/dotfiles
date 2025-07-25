---@type NvPluginSpec
-- NOTE: Notification
return {
	"rcarriga/nvim-notify",
	-- lazy = false,
	event = "VeryLazy",
	opts = {
		level = 2,
		minimum_width = 50,
		render = "default",
		stages = "fade_in_slide_out",
		timeout = 3000,
		top_down = false,
	},
	config = function(_, opts)
		local base46 = require("nvconfig").base46

		if base46.transparency then
			opts.background_colour = "#000000"
		end

		require("notify").setup(opts)

		vim.notify = require("notify")

		vim.notify("let's go!", vim.log.levels.INFO, { title = "Just For Fun:" })
	end,
}
