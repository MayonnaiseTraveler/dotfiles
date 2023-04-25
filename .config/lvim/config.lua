vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
lvim.colorscheme = "rose-pine"
lvim.format_on_save = true
vim.opt.foldmethod = "expr"                     -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
lvim.builtin.lualine.style = "lvim"             -- or "none"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.dap.active = true                  -- (default: false)
lvim.transparent_window = true
lvim.lsp.diagnostics.virtual_text = false
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.shiftwidth = 4    -- the number of spaces inserted for each indentation
vim.opt.scrolloff = 8     -- is one of my fav
vim.opt.sidescrolloff = 8
-- lvim.cmd("inoremap <kj> <Esc>")
-- vim.cmd("au ColorScheme * hi Normal ctermbg=0 guibg=0")
lvim.keys.insert_mode["<M-k>"] = "<Esc>"
-- lvim.keys.visual_mode["<M-k>"] = "<Esc>"
lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
vim.opt.relativenumber = true



lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- - lvim.builtin.which_key.mappings["e"] = { "<cmd>RnvimrToggle<CR>", "Ranger" }

lvim.builtin.which_key.mappings['e'] = {}
-- lvim.builtin.which_key.mappings["e"] = { "<cmd>Ranger<CR>", "explorer" }
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
lvim.builtin.nvimtree.active = true
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

if vim.g.neovide then
	vim.g.neovide_scale_factor = 0.5
	-- vim.g.neovide_transparency = 1.0
	-- vim.g.neovide_transparency_point = 0.0

	local alpha = function()
		return string.format("%x", math.floor(255 * vim.g.neovide_transparency_point or 0.8))
	end

	vim.g.neovide_refresh_rate = 144
	-- vim.g.neovide_background_color = "#0f1117" .. alpha()

	-- Put anything you want to happen only in Neovide here
end


-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "" })

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup = {
	{
		filetypes = { "c", "h" },
		command = "clang-format",
	},
	{
		filetypes = { "html", "ejs" },
		command = "eslint"
	},
	-- {
	-- 	command = "eslint",
	-- 	filetypes = { "javascript", "ejs" },
	-- },

	-- args = { "--style=linux"  },
}


local dap = require('dap')

dap.configurations.c = {
	{
		type = 'c',
		request = 'launch',
		name = 'bnnuy',
		program = '${workspaceFolder}/package/linux/bnnuy',
	}
}

dap.adapters.c = {
	type = 'server',
	port = "${port}",
	executable = {
		command = '/usr/bin/codelldb',
		args = { "--port", "${port}" },
	}
}

lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.highlight.enabled = false




-- Additional Plugins
lvim.plugins = {
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
	{ 'is0n/fm-nvim' },
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
				pre_hook = nil,  -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
		end
	},

}


lvim.autocommands = {
	-- {
	-- 	{ "BufEnter", "Filetype" },
	-- 	{
	-- 		desc = "Open mini.map and exclude some filetypes",
	-- 		pattern = { "*" },
	-- 		callback = function()
	-- 			local exclude_ft = {
	-- 				"qf",
	-- 				"NvimTree",
	-- 				"toggleterm",
	-- 				"TelescopePrompt",
	-- 				"alpha",
	-- 				"netrw",
	-- 			}

	-- 			local map = require('mini.map')
	-- 			if vim.tbl_contains(exclude_ft, vim.o.filetype) then
	-- 				vim.b.minimap_disable = true
	-- 				map.close()
	-- 			elseif vim.o.buftype == "" then
	-- 				map.open()
	-- 			end
	-- 		end,
	-- 	},
	-- },
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
--
-- require('fm-nvim').setup {
-- 	-- (Vim) Command used to open files
-- 	edit_cmd = "edit",

-- 	ui = {
-- 		-- Default UI (can be "split" or "float")
-- 		default = "float",
-- 		split = {
-- 			-- Direction of split
-- 			direction = "topleft",
-- 			-- Size of split
-- 			size      = 36
-- 		}
-- 	},

-- 	-- Terminal commands used w/ file manager (have to be in your $PATH)
-- 	cmds = {
-- 		lf_cmd          = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
-- 		fm_cmd          = "fm",
-- 		nnn_cmd         = "nnn",
-- 		fff_cmd         = "fff",
-- 		twf_cmd         = "twf",
-- 		fzf_cmd         = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
-- 		fzy_cmd         = "find . | fzy",
-- 		xplr_cmd        = "xplr",
-- 		vifm_cmd        = "vifm",
-- 		skim_cmd        = "sk",
-- 		broot_cmd       = "broot",
-- 		gitui_cmd       = "gitui",
-- 		ranger_cmd      = "ranger",
-- 		joshuto_cmd     = "joshuto",
-- 		lazygit_cmd     = "lazygit",
-- 		neomutt_cmd     = "neomutt",
-- 		taskwarrior_cmd = "taskwarrior-tui"
-- 	},

-- 	-- Mappings used with the plugin
-- 	mappings = {
-- 		vert_split = "<C-v>",
-- 		horz_split = "<C-h>",
-- 		tabedit    = "<C-t>",
-- 		edit       = "<C-e>",
-- 		ESC        = "<ESC>"
-- 	},
-- }
local cfg = {} -- add your config here
require "lsp_signature".setup(cfg)

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
