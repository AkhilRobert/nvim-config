return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'onsails/lspkind.nvim',
  },
  event = "InsertEnter",
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    ---@diagnostic disable: redundant-parameter
    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    cmp.setup({
      completion = {
        -- selects the first value of the completion menu automatically
        completeopt = 'menu,menuone,noinsert'
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ---@diagnostic disable-next-line: missing-parameter
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        {
          name = "buffer",
          {
            keyword_length = 5 },
        },
        { name = "path" },
      },
      window = {
      },
      experimental = {
        ghost_text = true
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol',
          preset = 'codicons',
        })
      }
    })

    cmp.event:on("confirm_done",
      cmp_autopairs.on_confirm_done({
        filetypes = {
          -- Disables for prisma files
          prisma = false
        }
      })
    )
  end
}
