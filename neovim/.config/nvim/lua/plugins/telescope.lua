return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = "nvim-telescope/telescope.nvim",
        ft = "mason",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        cmd = "Telescope",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        opts = {
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    -- BUG: when enable this config, telescope can't lazy load
                    -- require("telescope.themes").get_dropdown{},
                },
            },
        },
        config = function()
            require("telescope.themes").get_dropdown{}
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("fzf")
        end,
    },
}
