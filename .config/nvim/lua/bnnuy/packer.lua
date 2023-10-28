-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use "lukas-reineke/indent-blankline.nvim"
	use 'nvim-tree/nvim-web-devicons'
    use 'neoclide/coc.nvim'
	use 'RRethy/nvim-base16'
	use "MunifTanjim/nui.nvim"
	use "rcarriga/nvim-notify"
	use "folke/trouble.nvim"
	use 'folke/lsp-colors.nvim'

	use	'williamboman/mason.nvim'
	use {'nvim-lualine/lualine.nvim',requires = { 'nvim-tree/nvim-web-devicons', opt = true }}
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.4', requires = { {'nvim-lua/plenary.nvim'} }}
	use ('nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'})
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	use {"akinsho/toggleterm.nvim", tag = '*'}
	use 'kevinhwang91/rnvimr'
	use 'nacro90/numb.nvim'
	use {
	  'glepnir/dashboard-nvim',
	  event = 'VimEnter',
	  config = function()
	    require('dashboard').setup {
			theme='doom',
	    }
	  end,
	}
  	use {
	  "folke/which-key.nvim",
	  config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		require("which-key").setup {
		  -- your configuration comes here
		}
	  end
	}
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

end)



