require("toggleterm").setup({
	direction = "float",
	autochdir = true,
	size = 10,
	shade_terminals = true,
	open_mapping = [[<A-q>]],
	float_ops = {
		border = "single",
	},
	winbar = {
		enabled = true,
	},
})
