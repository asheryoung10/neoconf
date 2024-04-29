vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.scrolloff = 999
--window stuff that i made :)
vim.keymap.set("n", "<leader>wsl", "<c-w>v<cr>", 	{desc = "Right"})
vim.keymap.set("n", "<leader>wsj", "<c-w>s<cr>", 	{desc = "Down"})
vim.keymap.set("n", "<leader>wfh", "<c-w>h",		{desc = "Left"})
vim.keymap.set("n", "<leader>wfl", "<c-w>l",		{desc = "Right"})
vim.keymap.set("n", "<leader>wfk", "<c-w>k",		{desc = "Up"})
vim.keymap.set("n", "<leader>wfj", "<c-w>j",		{desc = "Down"})
vim.keymap.set("n", "<leader>wrk" , ":res +10<cr>", 	{desc= "Grow"})
vim.keymap.set("n", "<leader>wrj", ":res -10<cr>", 		{desc = "Shrink"})
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup( {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd[[colorscheme tokyonight-night]]
		end
	},
	{
  		"folke/which-key.nvim",
  		event = "VeryLazy",
		init = function()
    		vim.o.timeout = true
    		vim.o.timeoutlen = 0
			local wk = require("which-key")
      		wk.register({
        		["<leader>w"] = {
					name = "Window",
					["s"] = {
						name = "Split",
					},
					["f"] = {
						name = "Focus"
					},
					["r"] = {
						name = "Resize"
					},
        		},
				["<leader>f"] = {
					name = "FuzzyFind"

				},
				["<leader>t"] = {
					name = "Tree"
				},
      		})
  		end,
  		opts = {
    		-- your configuration comes here
    		-- or leave it empty to use the default settings
    		-- refer to the configuration section below
		},
	},
	{
		"williamboman/mason.nvim",
		config = function() 
			require("mason").setup()
		end
	},
	-- init.lua:
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
		config = function () 
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, 	{desc = "File"})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, 	{desc = "Live Grep"})
			vim.keymap.set('n', '<leader>fb', builtin.buffers, 		{desc = "Buffer"})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, 	{desc = "Help Tag"})
		end
    },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
		  local configs = require("nvim-treesitter.configs")
			configs.compilers = "gcc"
		  configs.setup({
			  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
			  sync_install = false,
			  highlight = { enable = true },
			  indent = { enable = true },  
        })
	    end
	},
	{
	  "nvim-tree/nvim-tree.lua",
	  version = "*",
	  lazy = false,
	  dependencies = {
		"nvim-tree/nvim-web-devicons",
	  },
	  config = function()
		local api = require("nvim-tree.api")
		vim.keymap.set("n", "<leader>tt", api.tree.toggle, {desc = "Toggle"})
		vim.keymap.set("n", "<leader>tf", api.tree.focus, {desc = "Focus"})
		vim.keymap.set("n", "<leader>tc", api.tree.close, {desc = "Close"})

		vim.keymap.set("n", "<leader>tr", api.tree.reload, {desc = "Refresh"})
	   vim.keymap.set("n", "<leader>tl", ":NvimTreeResize +10<cr>", {desc = "Grow"})

		vim.keymap.set("n", "<leader>th", ":NvimTreeResize -10<cr>", {desc = "Shrink"})
		require("nvim-tree").setup {}
	  end,
	},
	{
	 "neovim/nvim-lspconfig",
	 dependencies = {"mason.nvim"},
	 config = function() 
		local lspconfig = require('lspconfig')
		lspconfig.clangd.setup({})
		lspconfig.lua_ls.setup {
		  settings = {
			Lua = {
			  runtime = {
				version = 'LuaJIT',
			  },
			  diagnostics = {
				globals = {
				  'vim',
				  'require'
				},
			  },
			  workspace = {
				library = {
				  [vim.fn.expand('$VIMRUNTIME/lua')] = true,
				  [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
				  -- Add any other Lua libraries you want the language server to be aware of
				},
			  },
			  telemetry = {
				enable = false,
			  },
			},
		  },
		}
	 end
	}

})

