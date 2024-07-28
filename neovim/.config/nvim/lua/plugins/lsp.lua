return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    }, {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {"mason.nvim"},
        opts = {ensure_installed = {"lua_ls"}}
    }, {
        "neovim/nvim-lspconfig",
        dependencies = {"mason-lspconfig.nvim"},
        config = function()
            require('lspconfig').lua_ls.setup {settings = {['lua_ls'] = {}}}
        end
    }
}
