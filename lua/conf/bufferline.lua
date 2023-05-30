vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        indicator = {
            style = 'underline'
        },
        diagnostics = 'nvim_lsp'
    }
}
