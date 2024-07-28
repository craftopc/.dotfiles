return {
    "hrsh7th/nvim-cmp",
    version = false,
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
        "neovim/nvim-lspconfig", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
    },
    opts = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
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
                ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({select = true})
                        end
                    else
                        fallback()
                    end
                end),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {"i", "s"})
            }),
            sources = cmp.config.sources({
                {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
                {name = 'path'}, {name = 'cmdline'}
            })
        }
    end
}

