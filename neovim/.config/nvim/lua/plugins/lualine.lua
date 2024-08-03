return {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        options = {
            theme = "horizon",
            disabled_filetype = {
                statusline = {"dashboard", "lazy"},
                winbar = {},
            },
            ignore_focus = {"NvimTree"},
        }
    }
}
