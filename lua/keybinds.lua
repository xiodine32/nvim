local nvimtreeapi = require "nvim-tree.api"
vim.keymap.set("n", "<leader>pv", nvimtreeapi.tree.toggle)


vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>gs", ":Git<CR>")
-- vim.keymap.set({ 'n' }, '<C-k>', function()       require('lsp_signature').toggle_float_win() end, { silent = true, noremap = true, desc = 'toggle signature' })
-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})
