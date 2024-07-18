return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    lazy = false,
    opts = {},
    config = function() 
     
    require'nvim-tree'.setup {
  -- other options...
  update_cwd = true,
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  -- other options...
}

    end

}
