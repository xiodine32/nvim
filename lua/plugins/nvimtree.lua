return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = {
        view = {
            number = true,
            relativenumber = true,
        },
        filters = {
            dotfiles = true,
        },
        update_focused_file = {
            enable = true,
            update_root = true,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
}
