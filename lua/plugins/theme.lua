-- return {
--     'projekt0n/github-nvim-theme',
--     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--         require('github-theme').setup({
--             -- ...
--         })
--
--         vim.cmd('colorscheme github_dark_dimmed')
--     end,
-- }
return {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- style = "warm",
    },
    config = function(_, opts)
        require("onedark").setup(opts)
        vim.cmd([[colorscheme onedark]])
    end,
}
-- return {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         style = "night",
--     },
--     config = function(_, opts)
--         require("tokyonight").setup(opts)
--         vim.cmd([[colorscheme tokyonight]])
--     end,
-- }
