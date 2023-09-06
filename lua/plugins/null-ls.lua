return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "LspAttach",
  config = function()
    local null_ls = require("null-ls")

    local formatter = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions


    local revive = function()
      -- local config_filename = 'revive.toml'
      -- local args = { "-formatter", "json" }
      -- local exists = U.file_exists_cwd(config_filename)
      -- if exists then
      --   table.insert(args, "-config")
      --   table.insert(args, config_filename)
      -- end
      --
      -- table.insert(args, "./...")

      return diagnostics.revive.with({
        args = { "-config", "revive.toml", "-formatter", "json", "./..." }
      });
    end

    local codespell = function()
      return diagnostics.codespell.with({
        extra_args = { "-I", "/Users/akhilrobert/Documents/dictionary.txt" }
      })
    end


    local sources = {
      -- ts, js
      -- prettier
      formatter.prettierd,

      --python
      formatter.black,
      formatter.isort,

      -- go
      -- formatter.gofumpt,
      formatter.goimports,
      -- revive(),

      -- rust
      formatter.rustfmt,

      -- spelling
      codespell(),

      --git
      code_actions.gitsigns,
    }

    local on_attach = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      return function(_, bufnr)
        -- Autocmd for formatting on save
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    null_ls.setup({
      sources = sources,
      on_attach = on_attach()
    })
  end
}
