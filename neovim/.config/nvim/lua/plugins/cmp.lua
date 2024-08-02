return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
        "neovim/nvim-lspconfig", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
    },
    opts = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- lazydev
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {name = "lazydev", group_index = 0})

        return {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            windows = {},
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort,
                ['<CR>'] = cmp.mapping.confirm({select = true})

            }),
            sources = cmp.config.sources({
                {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
                {name = 'path'}, {name = 'cmdline'}
            })
        }
    end
}

