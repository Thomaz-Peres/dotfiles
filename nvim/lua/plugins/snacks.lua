return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", enabled = true },
	},
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true, animate = { duration = { step = 15, total = 250 } } },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		terminal = { enabled = true },
	},
	keys = {
		{
			"<leader>n",
			function()
				if Snacks.config.picker and Snacks.config.picker.enabled then
					Snacks.picker.notifications()
				else
					Snacks.notifier.show_history()
				end
			end,
			desc = "Notification History",
		},
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>pf",
			function()
				Snacks.picker.files()
			end,
			desc = "Find files",
		},
		{
			"<C-q>",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>ps",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Grep word",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>t",
			function()
				Snacks.terminal()
			end,
			desc = "Terminal",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gc",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Commits",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
	},
}
