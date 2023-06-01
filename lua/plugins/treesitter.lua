return {
        "nvim-treesitter/nvim-treesitter",
        build = function()
                require("nvim-treesitter.install").update({ with_sync = true })
        end,
        dependencies = {
                { "elgiano/nvim-treesitter-angular", branch = "topic/jsx-fix" }
        },
        opts = {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
                sync_install = false,
                auto_install = true,
                highlight = {
                        enable = true,
                        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                        -- Using this option may slow down your editor, and you may see some duplicate highlights.
                        -- Instead of true it can also be a list of languages
                        additional_vim_regex_highlighting = false,
                },
        },
        config = function (_, opts)
                require'nvim-treesitter.configs'.setup(opts)
        end
}
