-- sets

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
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

-- vim highlight
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('HighlightYank', {}),
    pattern = '*',
    callback = function() vim.highlight.on_yank() end,
})

-- keybindings
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- telescope
local tel = require('telescope')
tel.setup()
tel.load_extension('fzf')
local telbin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telbin.git_files)
vim.keymap.set('n', '<leader>fg', telbin.live_grep)
vim.keymap.set('n', '<leader>ff', telbin.find_files)
vim.keymap.set('n', '<leader>fb', telbin.buffers)
vim.keymap.set('n', '<leader>fh', telbin.help_tags)
-- undotree
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- git
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
-- bufferline
vim.keymap.set('n', 'gb', '<CMD>BufferLinePick<CR>')
vim.keymap.set('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', '<S-q>', ':bd<CR>')
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', ']b', '<CMD>BufferLineMoveNext<CR>')
vim.keymap.set('n', '[b', '<CMD>BufferLineMovePrev<CR>')
vim.keymap.set('n', 'gs', '<CMD>BufferLineSortByDirectory<CR>')

-- keymap
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)
