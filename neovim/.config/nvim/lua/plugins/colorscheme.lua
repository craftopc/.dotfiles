return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = true,
        opts = {
            transparent_background = true,
            dashboard = true,
            flash = true,
            mason = false,
            cmp = true,
            dap = true,
            dap_ui = true,
            notify = false,
            nvimtree = true,
            treesitter = true,
            rainbow_delimiter = true,
            telescope = {
                enabled = true
            },
            lsp_trouble = false,
            which_key = false
        }
    }, {"folke/tokyonight.nvim", lazy = true, priority = 1000, opts = {}}
}
