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

        -- judge complete
        local has_word_before = function()
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))

            return col ~= 0 and
                       vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                           col, col):match("%s") == nil
        end

        -- lazydev
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0,
        })

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
                            -- cmp.confirm({select = false})
                            fallback()
                        end
                    else
                        fallback()
                    end
                end),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_word_before() then
                        cmp.complete()
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

