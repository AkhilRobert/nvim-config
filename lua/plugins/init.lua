local packer = require("packer")

packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })

	-- Colorschemes
	use("Mofiqul/vscode.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer" })
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- cmp(Autocomplete plugin)
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	use("onsails/lspkind-nvim")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local telescope = require("telescope")
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

	use("ChristianChiarulli/nvim-ts-rainbow")

	use({
		"windwp/nvim-autopairs",
		config = function()
			local autopairs = require("plugins.autopairs")
			autopairs.setup()
		end,
	})
	use("windwp/nvim-ts-autotag")

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

	-- Editor
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("plugins.tree").setup()
		end,
	})
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			local statusline = require("plugins.statusline")
			statusline.setup()
		end,
	})

	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				patterns = { "package.json", "pyproject.toml" },
				detection_methods = { "pattern", "lsp" },
			})
		end,
	})

	use("nvim-lua/lsp-status.nvim")
end)
