vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>c", "<C-w>c")
vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")


vim.keymap.set("n", "<S-x>", ":BufferClose<CR>")
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")


-- Better Movement -- 
vim.keymap.set("i", "<M-k>", "<Esc>")
vim.keymap.set("", "<M-1>",":ToggleTerm direction=horizontal <CR>")
vim.keymap.set("", "<M-2>",":ToggleTerm direction=vertical <CR>")
vim.keymap.set("", "<M-3>",":ToggleTerm direction=float <CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n",'<leader>r',":RnvimrToggle<CR>")
--vim.keymap.set("n",'<leader>e',":Ranger<CR>")

function _G.set_terminal_keymaps()
	local opts = {buffer = 0}
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
	vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "<C-h>", "<C-w>h")
	vim.keymap.set("t", "<C-l>", "<C-w>l")
	vim.keymap.set("t", "<C-j>", "<C-w>j")
	vim.keymap.set("t", "<C-k>", "<C-w>k")
end
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

