return {
	"obsidian-nvim/obsidian.nvim",
	dependencies = {
		"folke/snacks.nvim",
	},
	cmd = "Obsidian",
	opts = {
		legacy_commands = false, -- this will be removed in 4.0.0
		workspaces = {
			{
				name = "Notes",
				path = "~/Documents/Notes",
			},
			{
				name = "Dungeons",
				path = "~/Documents/Dungeons",
			},
		},
		daily_notes = {
			enabled = true,
			folder = "Journals",
			date_format = "YYYY-MM-DD",
			template = "journal-note.md",
			default_tags = {},
		},
		templates = {
			folder = "_templates/",
		},
		link = {
			style = "wiki",
			format = "shortest",
			auto_update = true,
		},
		callbacks = {
			enter_note = function(note)
				vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", {
					buffer = true,
					desc = "Toggle checkbox",
				})
				vim.keymap.set("n", "<leader>o", "<cmd>Obsidian quick_switch<cr>", {
					buffer = true,
					desc = "Quick switch",
				})
			end,
		},
	}
}
