return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "lua",
            "c",
            "markdown",
            "markdown_inline",
            "vimdoc",
        },
        sync_install = false,
        auto_install = true,
    },
}
