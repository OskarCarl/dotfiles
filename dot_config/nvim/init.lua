-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("config.lazy")
require("config.tree")
require("config.mini")
require("config.obsidian")
require("config.fastaction")

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
vim.o.conceallevel = 2

-- Show hybrid line numbers (absolute for the current and relative for all others)
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"
vim.opt.number = true
vim.opt.relativenumber = true

-- Theme
require("kanagawa").setup({
	transparent = true,       -- do not set background color
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave",
})
vim.cmd("colorscheme kanagawa")
vim.opt.termguicolors = true
vim.opt.guicursor = "i:hor10"

-- Keybindings
-- Switch between different windows by their direction
vim.keymap.set({ 'n', 'o', 'v' }, '<C-j>', "<C-w>j", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-k>', "<C-w>k", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-l>', "<C-w>l", { remap = true })
vim.keymap.set({ 'n', 'o', 'v' }, '<C-h>', "<C-w>h", { remap = true })

-- Switch to next buffer with Ctrl+Tab
vim.keymap.set("n", "<C-Tab>", ":bnext<CR>", {
	noremap = true,
	silent = true,
	desc = "Switch to next buffer",
})
-- Switch to previous buffer with Ctrl+Shift+Tab
vim.keymap.set("n", "<C-S-Tab>", ":bprevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Switch to previous buffer",
})

-- Folding
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.opt.foldenable = false -- Unfolded by default

vim.o.showmode = false

require('markdowny').setup()

-- require('config.harper')

