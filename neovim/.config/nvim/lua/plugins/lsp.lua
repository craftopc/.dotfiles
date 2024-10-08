return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        opts = { ensure_installed = { "lua_ls" } },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim" },

        config = function()
            local lsp_configurations = {
                lua_ls = {
                    settings = {
                        ["lua_ls"] = {},
                    },
                },
                clangd = {
                    settings = {
                        ["clangd"] = {},
                    },
                },
                rust_analyzer = {
                    settings = {
                        ["rust_analyzer"] = {},
                    },
                },
                pyright = {
                    settings = {
                        ["pyright"] = {},
                    },
                },
                ruff_lsp = {
                    settings = {
                        ["ruff_lsp"] = {},
                    },
                },
            }

            for lsp_name, lsp_settings in pairs(lsp_configurations) do
                require("lspconfig")[lsp_name].setup(lsp_settings)
            end
        end,
    },
}
