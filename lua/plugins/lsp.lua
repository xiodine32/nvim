return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    lazy = true,
    dependencies = {
        {
            "neovim/nvim-lspconfig",
            cmd = "LspInfo",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "williamboman/mason-lspconfig.nvim" },
                {
                    "williamboman/mason.nvim",
                    build = function()
                        pcall(function() vim.cmd [[:MasonUpdate]] end)
                    end,
                },
            },
            opts = {
                inlay_hints = {
                    enabled = true,
                    parameter_hints = true,
                    type_hints = true,
                    highlight = "Comment",
                    priority = 0,
                },
            },
            config = function(_, opts)
                local lsp = require("lsp-zero")

                lsp.on_attach(function(client, bufnr)
                    lsp.default_keymaps({ buffer = bufnr })
                    if client.supports_method("textDocument/formatting") then
                        require("lsp-format").on_attach(client)
                    end
                end)

                -- (Optional) Configure lua language server for neovim
                require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

                lsp.setup(opts)
            end,
        },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                { "L3MON4D3/LuaSnip" },
            },
            config = function()
                require("lsp-zero.cmp").extend()
                local lsp = require("lsp-zero").preset("recommended")

                local cmp = require("cmp")
                local cmp_action = require("lsp-zero.cmp").action()
                -- local cmp_select = { behavior = cmp.SelectBehavior.Select }

                local cmp_mappings = lsp.defaults.cmp_mappings({
                    -- ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    -- ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    -- ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                })
                cmp.setup({
                    mapping = cmp_mappings,
                })
            end,
        },
        { "lukas-reineke/lsp-format.nvim" },
    },
    config = function()
        require("lsp-zero.settings").preset("recommended")
    end,
}
