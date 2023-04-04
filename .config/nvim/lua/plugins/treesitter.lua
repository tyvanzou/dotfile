require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"rust",
		"vim",
		"help",
		"bash",
		"c",
		"cpp",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"tsx",
		"css",
		"scss",
		"markdown",
		"markdown_inline",
	}, -- one of "all" or a list of languages

	-- highlight
	highlight = {
		enable = true,
		disable = {},
	},
})
