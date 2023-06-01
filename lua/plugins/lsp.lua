return {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim', build = function() vim.cmd[[:MasonUpdate]] end },
                { 'williamboman/mason-lspconfig.nvim' },
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'L3MON4D3/LuaSnip' },
        },
        opts = {
                inlay_hints = {
                        enabled = true,
                        parameter_hints = true,
                        type_hints = true,
                        highlight = 'Comment',
                        priority = 0,
                }
        },
        config = function(_, opts)
                local lsp = require('lsp-zero').preset("recommended")

                lsp.on_attach(function(_, bufnr)
                        lsp.default_keymaps({ buffer = bufnr })
                end)

                -- (Optional) Configure lua language server for neovim
                require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

                lsp.setup(opts)

                -- You need to setup `cmp` after lsp-zero
                local cmp = require('cmp')
                local cmp_select = {behavior = cmp.SelectBehavior.Select}
                local cmp_mappings = lsp.defaults.cmp_mappings({
                  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                  ["<C-Space>"] = cmp.mapping.complete(),
                })
                cmp_mappings['<Tab>'] = nil
                cmp_mappings['<S-Tab>'] = nil

                cmp.setup({ mapping = cmp_mappings })
        end
}
