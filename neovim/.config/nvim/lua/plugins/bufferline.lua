return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
        options = {
            mode = "buffers",
            themable = false,
            buffer_close_icon = "󰅚 ",
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    highlight = "Directory",
                    separator = true,
                },
            },
            separator_style = "thick",
        },
    },
}
