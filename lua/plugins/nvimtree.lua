return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { 'NvimTreeToggle' },
    opts = {
        view = {
            number = true,
            relativenumber = true

        }
    }
}
