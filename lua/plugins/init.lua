local packer = require("packer")

packer.startup({
  function(use)
    use({ "wbthomason/packer.nvim", opt = true })
    use { 'dstein64/vim-startuptime' }

    use "lukas-reineke/indent-blankline.nvim"

    -- Colorschemes
    use 'Mofiqul/vscode.nvim'

    -- Utils
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")

    -- Lsp
    use("neovim/nvim-lspconfig")
    use {
      "williamboman/mason.nvim",
      config = function()
        require('mason').setup()
      end
    }
    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require('lsp_signature').setup({})
      end
    }

    -- Custom implementation of language servers
    use { "mfussenegger/nvim-jdtls",
      ft = { "java" },
      config = function()
        require('lsp.servers.jdtls').setup()
      end
    }

    use({
      "mhanberg/elixir.nvim",
      ft = { "elixir", "eelixir", "heex", "surface" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require('lsp.servers.elixirls').setup()
      end
    })

    use({
      "glepnir/lspsaga.nvim",
      cmd = "Lspsaga",
      config = function()
        local saga = require('plugins.saga')
        saga.setup()
      end,
    })

    use {
      "j-hui/fidget.nvim",
      config = function()
        local fidget = require('fidget')
        fidget.setup()
      end
    }

    -- Typescript
    use {
      "jose-elias-alvarez/typescript.nvim",
      ft = { "typescript", "typescriptreact", "javascript" },
      config = function()
        local tsserver = require('lsp.servers.tsserver')
        tsserver.setup()
      end
    }

    -- cmp(Autocomplete plugin)
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer"

      },
    }
    use { "onsails/lspkind.nvim" }

    -- snippet engine
    use {
      "L3MON4D3/LuaSnip",
    }
    use("saadparwaiz1/cmp_luasnip")

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      cmd = "Telescope",
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
    use('nvim-treesitter/playground')
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
        local ok, gitsigns = pcall(require, "plugins.gitsigns")
        if ok then
          gitsigns.setup()
        end
      end,
    })

    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      cmd = "Neotree",
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
    -- Flutter
    use({
      "akinsho/flutter-tools.nvim",
      requires = {
        "stevearc/dressing.nvim"
      }
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = true })
      end
    }
  }
})
