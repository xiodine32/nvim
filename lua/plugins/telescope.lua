return {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
                { "nvim-lua/plenary.nvim" },
                {
                        "nvim-telescope/telescope-fzf-native.nvim",
                        build = "make",
                        config = function()
                                require("telescope").load_extension("fzf")
                        end,
                },
        },
        opts = {},
        config = function(_, opts)
                require("telescope").setup(opts)
                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>fp", builtin.git_files, {})
                vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
                vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
                vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
                vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        end,
}
