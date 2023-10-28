require("bnnuy.remap")
require("bnnuy.colorscheme")
require("bnnuy.packer")
require("bnnuy.lualine")

vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "expr"                     -- folding set to "expr" for treesitter based folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.cursorline = false
vim.opt.tabstop = 4
vim.opt.expandtab = false -- convert tabs to spaces
vim.opt.shiftwidth = 4    -- the number of spaces inserted for each indentation
vim.opt.scrolloff = 8     -- is one of my fav
vim.opt.sidescrolloff = 8
vim.opt.relativenumber = true
vim.opt.fillchars:append { eob = " " }

require("bufferline").setup{}
require("lualine").setup{}
require("toggleterm").setup{
	shade_terminals = false,
	winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
	  },
}
--
--require("ranger-nvim").setup({
--	replace_netrw = true,
--	enable_cmds = true,
--	 ui = {
--    border = "rounded",
--    height = 0.75,
--    width = 0.75,
--    x = 0.5,
--    y = 0.5,
--  }
--})

-- autocmd BufEnter * :lua require('lazygit.utils').project_root_dir()
