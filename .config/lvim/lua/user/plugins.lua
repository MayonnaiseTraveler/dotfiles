local M = {}


-- Additional Plugins
M.setup = function()
	lvim.plugins = {
		{ 'rrethy/nvim-base16' },
		{ "elkowar/yuck.vim" },
		{ "ray-x/lsp_signature.nvim" },
		{
			"kevinhwang91/rnvimr",
			cmd = "RnvimrToggle",
			config = function()
				vim.g.rnvimr_draw_border = 1
				vim.g.rnvimr_pick_enable = 1
				vim.g.rnvimr_bw_enable = 1
			end,
		},
		{
			"luckasRanarison/tree-sitter-hyprlang",
			requires = { "nvim-treesitter/nvim-treesitter" },
		},
		{
			"folke/trouble.nvim",
			cmd = "TroubleToggle",
		},
		{
			"phaazon/hop.nvim",
			event = "BufRead",
			config = function()
				require("hop").setup()
				vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
			end,
		},
		{ 'kyazdani42/blue-moon' },
		{ "yonlu/omni.vim" },
		{ "yashguptaz/calvera-dark.nvim" },
		{ "rose-pine/neovim" },
		{
			"catppuccin/nvim",
			as = "catppuccin"
		},
		{ 'ishan9299/nvim-solarized-lua' },
		{ 'sainnhe/everforest' },
		-- refer to the configuration section below
		{
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
				}
			end
		},
		{ 'deviantfero/wpgtk.vim' },
		{
			"ellisonleao/glow.nvim",
			config = function() require("glow").setup() end
		},

		{ 'EdenEast/nightfox.nvim' },
		{ 'psliwka/termcolors.nvim' },
		{
			"karb94/neoscroll.nvim",
			event = "WinScrolled",
			config = function()
				require('neoscroll').setup({
					-- All these keys will be mapped to their corresponding default scrolling animation
					mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
						'<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
					hide_cursor = false, -- Hide cursor while scrolling
					stop_eof = true, -- Stop at <EOF> when scrolling downwards
					use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
					respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
					cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
					easing_function = nil, -- Default easing function
					pre_hook = nil, -- Function to run before the scrolling animation starts
					post_hook = nil, -- Function to run after the scrolling animation ends
				})
			end
		},
		{
			"sayanarijit/xplr.vim",
		}
	}
end
return M
