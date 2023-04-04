-- 默认不开启nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
	renderer = {
		-- indent_width = 2,
		indent_markers = {
			enable = true,
		},
		icons = {
			webdev_colors = true,
			show = {
				file = true,
				folder = false,
				folder_arrow = true,
				git = true,
				modified = true,
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		symlink_destination = true,
	},
})
