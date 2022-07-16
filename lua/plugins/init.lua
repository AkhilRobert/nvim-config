local packer = require("packer")

packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })

	-- Colorschemes
	use("Mofiqul/vscode.nvim")

	-- Utils
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer" })

	use({
		"tami5/lspsaga.nvim",
		config = function()
			local lspsaga = require("lspsaga")
			lspsaga.init_lsp_saga({
				code_action_prompt = {
					enable = false,
				},
			})
		end,
	})

	-- cmp(Autocomplete plugin)
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer"
		},
	}

	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local telescope = require("plugins.telescope")
			telescope.setup()
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			local treesitter = require("plugins.treesitter_setup")
			treesitter.setup()
		end,
	})

	use("p00f/nvim-ts-rainbow")

	-- Autopairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require('plugins.autopairs')
			autopairs.setup()
		end,
	})
	use { "windwp/nvim-ts-autotag" }

	-- Formatter & Linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			local comment = require("plugins.commenter")
			comment.setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			local gitsigns = require("plugins.gitsigns")
			gitsigns.setup()
		end,
	})

	use {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		config = function()
			local tree = require('plugins.tree')
			tree.setup()
		end
	}

	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			local statusline = require("plugins.statusline")
			statusline.setup()
		end,
	})

	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
end)
