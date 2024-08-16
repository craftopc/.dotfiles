return {
    { "echasnovski/mini.pairs", version = false, opts = {} },
    { "echasnovski/mini.diff", version = false, opts = {} },
    { "echasnovski/mini.cursorword", version = false, opts = {} },
    { "echasnovski/mini.icons", version = false, opts = {} },
    { "echasnovski/mini.move", version = false, opts = {} },
    {
        "echasnovski/mini.indentscope",
        version = false,
        event = "VeryLazy",
        opts = {},
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "dashboard",
                    "help",
                    "lazy",
                    "mason",
                    "neo-tree",
                    "notify",
                    "toggleterm",
                    "trouble",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
}
