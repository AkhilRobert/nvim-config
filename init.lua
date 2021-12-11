require("settings")

require("packer-setup")
require("plugins")
require("keymappings")

require("lsp")
require("colorscheme")

-- @todo find a better way to handle this plugin import
require("plugins.cmp")
require("plugins.treesitter_setup")
require("plugins.autopairs")
require("plugins.commenter")
require("plugins.gitsigns")
require("plugins.null")
require("plugins.statusline")
require("plugins.nvimtree")
