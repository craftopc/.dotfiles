return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim"
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            sources = {
                "filesystem", "buffers", "git_status", "document_symbols"
            },
            source_selector = {
                winbar = true,
                statusline = false,
                show_scrolled_off_parent_node = false,
                sources = {
                    {
                        source = "filesystem", -- string
                        display_name = " 󰉓 Files " -- string | nil
                    },
                    {source = "document_symbols", display_name = "󰈙 Symbols"}
                },
                separator = {left = "", right = ""}
            }
        }
    }
}
