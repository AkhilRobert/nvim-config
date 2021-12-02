local packer = require('packer')

packer.startup(function(use)

    use {'wbthomason/packer.nvim', opt = true}

    -- Colorschemes
    use 'Mofiqul/vscode.nvim'

		-- Lsp
    use 'neovim/nvim-lspconfig'
    use {'williamboman/nvim-lsp-installer'}
		use 'nvim-lua/plenary.nvim'

    -- cmp(Autocomplete plugin)
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind-nvim'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Highlight
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

		-- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

		use 'ChristianChiarulli/nvim-ts-rainbow'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'


		-- Formatter & Linter
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"}
    })


    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use 'JoosepAlviste/nvim-ts-context-commentstring'


    -- Git
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}


		-- Editor
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			config = function() require'nvim-tree'.setup {} end
		}
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}


end)
