local keymap = vim.keymap
local opts = {noremap = true, silent = true, desc = ""}
opts.desc = "Focus Left"
keymap.set("n", "<leader>wh", "<C-w>h", opts)
opts.desc = "Focus Down"
keymap.set("n", "<leader>wj", "<C-w>j", opts)
opts.desc = "Focus Up"
keymap.set("n", "<leader>wk", "<C-w>k", opts)
opts.desc = "Focus Right"
keymap.set("n", "<leader>wl", "<C-w>l", opts)
opts.desc = "Close Others"
keymap.set("n", "<leader>wm", "<C-w>o", opts)

vim.keymap.set('n', '<leader>tt', function()
  -- Check if the current buffer is NvimTree
  if vim.fn.bufname():match 'NvimTree_' then
    -- Switch focus away from NvimTree
    vim.cmd.wincmd 'p'
  else
    -- Focus NvimTree
    require('nvim-tree.api').tree.toggle(false, true)
  end
end, { desc = 'Toggle NvimTree' })


