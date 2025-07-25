return {
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local cmp = require("cmp")
			local conf = require("nvchad.configs.cmp")

			local mymappings = {
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}
			conf.mapping = vim.tbl_deep_extend("force", conf.mapping, mymappings)
			return conf
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			-- configuration goes here
			lang = "javascript",
		},
	},

	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false,
			message_template = " <summary> • <date> • <author> • <<sha>>",
			date_format = "%m-%d-%Y %H:%M:%S",
			virtual_text_column = 1,
		},
		keys = {
			{ "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
		},
	},

	{
		"mluders/comfy-line-numbers.nvim",
		event = "VeryLazy",
	},
}
