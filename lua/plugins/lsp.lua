return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { 'folke/neodev.nvim', opts = {} },
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.preset("recommended")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        lsp.on_attach(function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end)
        lsp.nvim_workspace()
        lsp.setup()
        vim.diagnostic.config({ virtual_text = true })

        local cmp = require("cmp")

        cmp.setup({
            sources = {
                -- Copilot Source
                -- { name = "copilot",  group_index = 2 },
                -- Other Sources
                { name = "nvim_lsp", group_index = 2 },
                { name = "path",     group_index = 2 },
                { name = "luasnip",  group_index = 2 },
            },
            mapping = {
                ["<C-Space>"] = cmp.mapping.complete(),
            },
        })
    end,
}
