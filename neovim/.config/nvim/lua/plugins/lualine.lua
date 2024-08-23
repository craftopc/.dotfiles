return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function ()
        vim.o.laststatus = 3
    end,
    opts = function()
        local opts = {
            options = {
                theme = "catppuccin",
                globalstatus = true,
                disabled_filetypes = {
                    statusline = { "dashboard" , "TelescopePrompt"},
                    winbar = {},
                },
                ignore_focus = {
                    "dap-repl",
                    "dapui_watches",
                    "dapui_stacks",
                    "dapui_breakpoints",
                    "dapui_scopes",
                    "dapui_console",
                },
            },
            extensions = { "neo-tree", "lazy", "mason"},
        }

        return opts
    end,
}
