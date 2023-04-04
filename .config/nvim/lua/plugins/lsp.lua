require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local ensure_installed = {
	"lua_ls",
	-- c
	"clangd",
	"cmake",
	-- front
	"cssls",
	"html",
	-- ts
	-- "tsserver",
	-- vue
	"volar",
	-- java
	"jdtls",
	-- js
	"quick_lint_js",
	-- markdown
	"marksman",
	-- python
	"pylsp",
	-- "pyright",
	-- rust
	"rust_analyzer",
}

require("mason-lspconfig").setup({
	-- 确保安装，根据需要填写
	ensure_installed = ensure_installed,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local function get_typescript_server_path(root_dir)
	local global_ts = "/home/icarus/.local/share/pnpm/global/5/node_modules/typescript/lib"
	-- Alternative location if installed as root:
	-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
	local found_ts = ""
	local function check_dir(path)
		found_ts = util.path.join(path, "node_modules", "typescript", "lib")
		if util.path.exists(found_ts) then
			return path
		end
	end
	if util.search_ancestors(root_dir, check_dir) then
		return found_ts
	else
		return global_ts
	end
end

for _, lsp in pairs(ensure_installed) do
	if lsp == "volar" then
		lspconfig[lsp].setup({
			filetypes = {
				"typescript",
				"javascript",
				"javascriptreact",
				"typescriptreact",
				"vue",
				"json",
			},
			on_new_config = function(new_config, new_root_dir)
				new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
			end,
		})
	else
		lspconfig[lsp].setup({
			capabilities = capabilities,
		})
	end
end
