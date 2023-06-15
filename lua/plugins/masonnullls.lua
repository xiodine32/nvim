return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim" },
        {
            "jose-elias-alvarez/null-ls.nvim",
            opts = {},
            depends = { "nvim-lua/plenary.nvim" },
        }
    },
    opts = {
        ensure_installed = nil,
        automatic_installation = true
    }
}
