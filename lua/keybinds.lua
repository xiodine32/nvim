vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>gs", ":Git<CR>")

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
