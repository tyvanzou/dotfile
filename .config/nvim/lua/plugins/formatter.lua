local util = require("formatter.util")

local python = require("formatter.filetypes.python")
local rust = require("formatter.filetypes.rust")
local lua = require("formatter.filetypes.lua")

local prettier = require("formatter.defaults.prettier")
local clangfmt = require("formatter.defaults.clangformat")

local filetype = {
	python = python.autopep8,
	rust = rust.rustfmt,
	lua = lua.stylua,
}

-- prettir
local prettier_list =
	{ "javascript", "typescript", "html", "css", "sass", "less", "vue", "javascriptreact", "json", "typescriptreact" }
for _, value in pairs(prettier_list) do
	filetype[value] = function()
		return {
			exe = "prettier",
			args = {
				"--stdin-filepath",
				util.escape_path(util.get_current_buffer_file_path()),
				"--no-semi",
				"--single-quote",
			},
			stdin = true,
			try_node_modules = true,
		}
	end
end

-- clang
local clang_list = { "c", "cpp" }
for _, value in pairs(clang_list) do
	filetype[value] = clangfmt
end

require("formatter").setup({
	filetype = filetype,
})
