lvim.format_on_save = false
lvim.colorscheme = "rose-pine"
vim.opt.foldmethod = "expr" -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
lvim.builtin.lualine.style = "lvim" -- or "none"
lvim.builtin.lualine.options.theme = "auto"
lvim.transparent_window = true
lvim.lsp.diagnostics.virtual_text = false
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
-- lvim.cmd("inoremap <kj> <Esc>")
lvim.keys.insert_mode["<M-k>"] = "<Esc>"
-- lvim.keys.visual_mode["<M-k>"] = "<Esc>"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.opt.relativenumber = true


lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- - lvim.builtin.which_key.mappings["e"] = { "<cmd>RnvimrToggle<CR>", "Ranger" }


lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"yaml",
}

-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })



local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
	{ command = "astyle" },
}

lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.highlight.enabled = true

require('rose-pine').setup({
	dark_variant = 'moon',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = true,
	disable_float_background = true,
	disable_italics = false,
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},
	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})
-- Additional Plugins
lvim.plugins = {
	{ 'deviantfero/wpgtk.vim' },
	{ 'mhartington/oceanic-next' },
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
		'rose-pine/neovim',
		as = 'rose-pine',
		tag = 'v1.*',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	},
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
	{
		"echasnovski/mini.map",
		branch = "stable",
		config = function()
			require('mini.map').setup()
			local map = require('mini.map')
			map.setup({
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.diagnostic({
						error = 'DiagnosticFloatingError',
						warn  = 'DiagnosticFloatingWarn',
						info  = 'DiagnosticFloatingInfo',
						hint  = 'DiagnosticFloatingHint',
					}),
				},
				window = {
					side = 'right',
					width = 10, -- set to 1 for a pure scrollbar :)
					winblend = 0,
					show_integration_count = false,
				},
			})
		end
	},
	{ "npxbr/glow.nvim" },
	{ "ray-x/lsp_signature.nvim",
		event = "BufRead",
	  	config = function() require"lsp_signature".on_attach() end,
	},
	{
		'norcalli/nvim-colorizer.lua',
	},
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

}
lvim.autocommands = {
	{
		{ "BufEnter", "Filetype" },
		{
			desc = "Open mini.map and exclude some filetypes",
			pattern = { "*" },
			callback = function()
				local exclude_ft = {
					"qf",
					"NvimTree",
					"toggleterm",
					"TelescopePrompt",
					"alpha",
					"netrw",
				}

				local map = require('mini.map')
				if vim.tbl_contains(exclude_ft, vim.o.filetype) then
					vim.b.minimap_disable = true
					map.close()
				elseif vim.o.buftype == "" then
					map.open()
				end
			end,
		},
	},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
