local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("lazy").setup({
        spec = { { import = "plugins" } },
        install = { colorscheme = { "tokyonight" } },
})

-- autoreformat
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- copilot keybinds:
-- <M-]> - copilot next
-- <M-[> - copilot prev
-- <M-\> - accept
