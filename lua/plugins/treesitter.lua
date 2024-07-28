return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    config = function() 
      local configs = require("nvim-treesitter.configs")
      require 'nvim-treesitter.install'.compilers = { "x86_64-w64-mingw32uwp-clang++" }
      configs.setup({
          ensure_installed = { "c", },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
