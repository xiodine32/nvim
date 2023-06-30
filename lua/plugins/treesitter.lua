return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    dependencies = {
        { "elgiano/nvim-treesitter-angular",         branch = "topic/jsx-fix" },
        { "nvim-treesitter/nvim-treesitter-context", opts = {} },
    },
    opts = {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "regex", "bash", "markdown_inline" },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
        require("nvim-treesitter.install").compilers = { "zig" }
    end,
}
