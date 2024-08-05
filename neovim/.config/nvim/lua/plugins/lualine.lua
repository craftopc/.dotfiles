return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        options = {
            theme = "catppuccin",
            disabled_filetype = {
                statusline = {"dashboard", "lazy"},
                winbar = {}
            },
            ignore_focus = {
                "neo-tree", "dap-repl", "dapui_watches", "dapui_stacks",
                "dapui_breakpoints", "dapui_scopes", "dapui_console"
            },
            extensions = {"nvim-dap-ui"}
        }
    }
}
