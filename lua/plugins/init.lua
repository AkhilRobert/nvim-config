local packer = require("packer")

packer.startup(function(use)
	use({ "wbthomason/packer.nvim", opt = true })

	-- Colorschemes
	use("Mofiqul/vscode.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use({ "williamboman/nvim-lsp-installer" })
	use("nvim-lua/plenary.nvim")

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
			local ok, telescope = pcall(require, "telescope")
			if not ok then
				return error("Unable to load telescope")
			end
			telescope.setup()
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			local ok, treesitter = pcall(require, "plugins.treesitter_setup")
			if not ok then
				return error("Unable to load treesitter")
			end
			treesitter.setup()
		end,
	})

	use("ChristianChiarulli/nvim-ts-rainbow")

	use({
		"windwp/nvim-autopairs",
		config = function()
			local ok, autopairs = pcall(require, "plugins.autopairs")
			if not ok then
				return error("Unable to load autopairs", 0)
			end
			autopairs.setup()
		end,
	})
	use("windwp/nvim-ts-autotag")

	-- Formatter & Linter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			local ok, null = pcall(require, "plugins.null")
			if not ok then
				return error("Unable to load null-ls", 0)
			end
			null.setup()
		end,
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			local ok, comment = pcall(require, "plugins.commenter")
			if not ok then
				return error("Unable to load commenter", 0)
			end
			comment.setup()
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			local ok, git = pcall(require, "plugins.gitsigns")
			if not ok then
				return error("Unable to load gitsigns", 0)
			end
			git.setup()
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
			local ok, lualine = pcall(require, "plugins.statusline")
			if not ok then
				return error("Unable to load status line", 0)
			end
			lualine.setup()
		end,
	})

	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})
end)
