----------
-- Comment
require('mini.comment').setup({
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = 'gcc',

		-- Toggle comment on current line
		comment_line = 'gcc',

		-- Toggle comment on visual selection
		comment_visual = 'gcc',

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = 'gc',
	},
})
vim.keymap.set({ 'n', 'i', 'v' }, '<C-/>', 'gcc', { remap = true })

-------------
-- Completion
require('mini.completion').setup()
-- Auto-accept the first suggestion with tab
vim.keymap.set('i', '<Tab>', [[pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"]], { expr = true })

-------
-- Clue
local miniclue = require('mini.clue')
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = { 'n', 'x' }, keys = '<Leader>' },

		-- `[` and `]` keys
		{ mode = 'n',          keys = '[' },
		{ mode = 'n',          keys = ']' },

		-- Built-in completion
		{ mode = 'i',          keys = '<C-x>' },

		-- `g` key
		{ mode = { 'n', 'x' }, keys = 'g' },

		-- Marks
		{ mode = { 'n', 'x' }, keys = "'" },
		{ mode = { 'n', 'x' }, keys = '`' },

		-- Registers
		{ mode = { 'n', 'x' }, keys = '"' },
		{ mode = { 'i', 'c' }, keys = '<C-r>' },

		-- Window commands
		{ mode = 'n',          keys = '<C-w>' },

		-- `z` key
		{ mode = { 'n', 'x' }, keys = 'z' },
	},

	clues = {
		-- Enhance this by adding descriptions for <Leader> mapping groups
		miniclue.gen_clues.square_brackets(),
		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
})

----------
-- Tabline
require('mini.tabline').setup()
vim.api.nvim_create_autocmd('BufEnter', {
	callback = vim.schedule_wrap(function()
		local n_listed_bufs = 0
		for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
			if vim.fn.buflisted(buf_id) == 1 then n_listed_bufs = n_listed_bufs + 1 end
		end

		-- Use either approach: first (commented) directly hides tabline while second makes it blank
		-- vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
		vim.o.tabline = n_listed_bufs > 1 and '%!v:lua.MiniTabline.make_tabline_string()' or ' '
	end),
	desc = 'Update tabline based on the number of listed buffers',
})
