-- TODO: move from legacy branch once migration is done
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  branch = "legacy",
  config = function()
    require('fidget').setup()
  end
}
