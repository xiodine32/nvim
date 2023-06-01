-- sets

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"

-- vim highlight
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope
local tel = require("telescope")
tel.setup({ extensions = { ["ui-select"] = { require("telescope.themes").get_cursor({}) } } })
tel.load_extension("fzf")
tel.load_extension("ui-select")
local telbin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", telbin.git_files)
vim.keymap.set("n", "<leader>fg", telbin.live_grep)
vim.keymap.set("n", "<leader>ff", telbin.find_files)
vim.keymap.set("n", "<leader>fb", telbin.buffers)
vim.keymap.set("n", "<leader>fh", telbin.help_tags)
vim.keymap.set("n", "<Leader>pp", telbin.quickfix)
-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
-- git
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
-- bufferline
vim.keymap.set("n", "gb", "<CMD>BufferLinePick<CR>")
vim.keymap.set("n", "<leader>ts", "<CMD>BufferLinePickClose<CR>")
vim.keymap.set("n", "<S-q>", ":bd<CR>")
vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>")
vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>")
vim.keymap.set("n", "gs", "<CMD>BufferLineSortByDirectory<CR>")
-- lsp
-- local opts = { buffer = bufnr, noremap = true, silent = true }
-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
-- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set({ "n", "v", "i" }, "<M-Enter>", vim.lsp.buf.code_action, {})

-- keymap
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
