return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        init = function ()
            vim.api.nvim_create_autocmd("BufEnter", {
                group = vim.api.nvim_create_augroup("Neotree_start_directory", {clear = true}),
                desc = "Start Neo-tree with directory",
                once = true,
                callback = function ()
                    if package.loaded["neo-tree"] then
                        return
                    else
                        local stats = vim.uv.fs_stat(vim.fn.argv(0))
                        if stats and stats.type == "directory" then
                            require("neo-tree")
                        end
                    end
                end
            })
        end,
        opts = {
            default_component_configs = {
                git_status = {
                    symbols = {
                        unstaged = "󰽂 ",
                        staged = "󰠘 ",
                    },
                },
            },
            window = {
                position = "left",
                width = 35,
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["<space>"] = "none",
                },
            },
        },
    },
}
