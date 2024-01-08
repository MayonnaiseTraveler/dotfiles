local M = {}


M.setup = function()
	lvim.leader = "space"
	lvim.keys.normal_mode["<leader>n"] = ""
	lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
	lvim.keys.insert_mode["<M-k>"] = "<Esc>"
	lvim.keys.normal_mode["<S-x>"] = ":BufferClose<CR>"
	lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
	lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
	lvim.builtin.which_key.mappings["e"] = { "<cmd>XplrPicker %:p<CR>", "Xplr" }

	lvim.builtin.which_key.mappings["n"] = {}

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
end
return M
