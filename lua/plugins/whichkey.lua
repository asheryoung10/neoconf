return {
  "folke/which-key.nvim",
lazy = false,
  opts = {
  },
  keys = {
  },
  config = function() 
      local wk = require("which-key")
        wk.add({
        {"<leader>w", group = "Window"},
        {"<leader>f", group = "Find"},
        {"<leader>t", group = "Tree"},
        {"<leader>l", group = "Lsp"},
        })
    end

}
