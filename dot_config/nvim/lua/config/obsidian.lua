vim.api.nvim_create_autocmd("User", {
	pattern = "ObsidianNoteEnter",
	callback = function(ev)
		vim.keymap.set("n", "<leader>o", "<cmd>Obsidian quick_switch<cr>", {
			buffer = true,
			desc = "Quick switch",
		})
	end,
})

vim.keymap.set("n", "<C-S-P>", ":<Left>Obsidian ", {
	remap = true,
	desc = "Obsidian Command",
})
