return {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    cmd = {"TSUpdate"},
    opts = {
        highlight = {enable = true},
        indent = {enable = true},
        ensure_installed = {
            "lua", "c", "python", "java", "markdown", "markdown_inline",
            "vimdoc", "query", "diff", "bash", "fish", "html", "javascript",
            "json", "regex", "toml", "yaml", "ini"
        }
    }
}
