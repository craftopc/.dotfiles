return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    priority = 999,
    opts = {
        options = {
            mode = "buffers",
            themable = false,
            buffer_close_icon = '󰅚 ',
            offsets ={
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "center",
                    highlight = "Directory",
                    separator = true
                }
            },
            separator_style = "thick"
        },
        -- highlight = require("catppuccin.groups.integrations.bufferline").get()
    }
}
