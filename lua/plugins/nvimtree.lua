return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    opts = {
        view = {
            number = true,
            relativenumber = true,
            float = {
                enable = true,
                open_win_config = {
                    relative = "cursor",
                    border = "rounded",
                    col = 1,
                    row = 1,
                    style = "minimal"
                }
            }
        },
        filters = {
            dotfiles = true
        },
        update_focused_file = { enable = true, update_root = true }
    }
}
