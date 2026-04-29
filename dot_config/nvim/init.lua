require("config.lazy")
require("config.tree")

vim.o.mouse = a
vim.o.swapfile = false
vim.o.compatible = false
vim.o.hlsearch = true
vim.o.ruler = true
vim.o.clipboard = "unnamedplus"
vim.o.modeline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- Theme options
vim.opt.termguicolors = true
vim.opt.guicursor = "i:hor10"
vim.g.gruvbox_italic = true
vim.o.background = "dark"

require('kanagawa').setup({
    transparent = true,          -- do not set background color
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",
})

vim.cmd("colorscheme kanagawa")


-- Keybindings
-- Switch between different windows by their direction
vim.keymap.set({ 'n', 'o', 'v' }, '<C-j>', "<C-w>j", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-k>', "<C-w>k", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-l>', "<C-w>l", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-h>', "<C-w>h", { remap = true })

-- Lualine
require('lualine').setup({
	options = { theme = "auto" },
})
vim.o.showmode = false

-- Nvim-tree
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
vim.keymap.set({ 'n', 'o', 'v' }, '<C-t>', "<cmd>NvimTreeOpen<cr>")
