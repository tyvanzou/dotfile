-- 自动安装packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugins.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require("packer").startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- theme
	use("EdenEast/nightfox.nvim")
	use("Shatur/neovim-ayu")
	use("cocopon/iceberg.vim")
	use({ "nyoom-engineering/oxocarbon.nvim" })
	use({ "embark-theme/vim", as = "embark" })
	use("rose-pine/neovim")
	use("shaunsingh/nord.nvim")
	use({ "projekt0n/github-nvim-theme", tag = "v0.0.7" })

	-- format
	use("mhartington/formatter.nvim")

	-- status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- icon
	})

	-- file tree
	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})

	use("christoomey/vim-tmux-navigator")

	-- highlight
	use("nvim-treesitter/nvim-treesitter")
	use("p00f/nvim-ts-rainbow")
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})
	-- auto complete
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")
	use("hrsh7th/cmp-path") -- file path

	-- comment
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs")

	-- bufferline
	use("akinsho/bufferline.nvim")

	-- git sign
	use("lewis6991/gitsigns.nvim")

	-- file search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- sniprun
	use({ "michaelb/sniprun", run = "bash ./install.sh" })
	-- code runner
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

	-- debug
	use("mfussenegger/nvim-dap")

	-- terminal
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	-- TODO tree
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
