vim.keymap.set(
	{ 'n', 'x' },
	'gra',
	'<cmd>lua require("fastaction").code_action()<CR>',
	{ desc = "Display code actions", buffer = bufnr }
)
