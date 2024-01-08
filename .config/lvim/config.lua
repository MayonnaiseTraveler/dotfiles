vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
lvim.colorscheme = "colorscheme_bnnuy"
-- lvim.colorscheme = "tokyonight-storm"
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.ejs", "*.lua", "*.py", "*.c", "*.json", "*.js", "*.css", "*.ts", "*.md", "*.html",
	"*.sh",
	"*.make", "*.cmake" }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.smartcase = true
vim.opt.smartindent = true
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "auto"
lvim.builtin.dap.active = true
lvim.transparent_window = true
lvim.lsp.diagnostics.virtual_text = true
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- lvim.cmd("inoremap <kj> <Esc>")
-- vim.cmd("au ColorScheme * hi Normal ctermbg=0 guibg=0")
-- lvim.keys.visual_mode["<M-k>"] = "<Esc>"
vim.opt.relativenumber = true




-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = false
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"html",
	"c", "javascript", "json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"cmake",
	"css",
	"scss",
	"rust",
	"yaml",
}

if vim.g.neovide then
	vim.g.neovide_scale_factor = 0.5
	vim.g.neovide_transparency = 1.0
	-- vim.g.neovide_transparency_point = 0.0

	vim.g.neovide_refresh_rate = 60
	-- vim.g.neovide_background_color = "#0f1117" .. alpha()

	-- Put anything you want to happen only in Neovide here
end


require("user.plugins").setup()


-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "" })

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })
-- require("lspconfig").prettier.setup({});

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup = {
	{
		name = "clang",
		filetypes = { "c", "h" },
		command = "clang-format",
	},
	{
		name = "prettier",
		filetypes = { "html", "ejs", "scss", "css", "js" },
		command = "prettier --bracket-same-line ",
	},

	-- {
	-- 	command = "eslint",
	-- 	filetypes = { "javascript", "ejs" },
	-- },

	-- args = { "--style=linux"  },
}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {

	{
		name = "stylelint",

		filetypes = { "html", "*.ejs", "*.scss", "*.css", "*.js" },
	},
	{
		name = "shellcheck",
		args = { "--severity", "warning" },
	},
}


local dap = require('dap')

dap.configurations.c = {
	{
		type = 'c',
		request = 'launch',
		name = 'darray',
		-- program = '${workspaceFolder}/package/linux/bnnuy',
		program = '${workspaceFolder}/dArray',
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
lvim.builtin.treesitter.auto_install = false
lvim.builtin.treesitter.highlight.enabled = true

lvim.autocommands = {
	{
		"BufEnter", {
		pattern = { "*.ejs" },
		callback = function()
			-- DYI editorconfig
			require("nvim-treesitter.highlight").attach(0, "html")
		end
	},
		{
			"BufWritePre", {
			pattern = { "*.ejs" },
			callback = function()
				-- DYI editorconfig
				require("nvim-treesitter.highlight").attach(0, "html")
			end
		},

		}


	}

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })



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

require("user.keybinds").setup()
