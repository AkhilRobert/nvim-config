return {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({
          symbol_in_winbar = {
            enable = false
          },
          ui = {
            border = 'rounded',
          }
        })
    end,
    dependencies = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
    keys = {
      { "K", "<cmd> Lspsaga hover_doc<CR>" },
      { "<leader>ln", "<cmd>Lspsaga rename<CR>"},
      { "<leader>la", "<cmd>Lspsaga code_action<CR>" },
      { "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>"},
      { "<leader>lf", "<cmd>Lspsaga lsp_finder<CR>"}
    }
}
