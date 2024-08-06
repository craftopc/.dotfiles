return {
    {
        "hrsh7th/nvim-cmp",
        version = false,
        event = {"InsertEnter", "CmdlineEnter"},
        dependencies = {
            "neovim/nvim-lspconfig", "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip", "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline"
        },
        opts = function(_, opts)
            local cmp = require("cmp")
            local lspkind = require('lspkind')
            local luasnip = require("luasnip")

            -- cmp config
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                           vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                               col, col):match("%s") == nil
            end

            -- lazydev
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {name = "lazydev", group_index = 0})

            return {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                window = {
                    completion = {
                        border = 'rounded',
                        scrollbar = false,
                        col_offset = -3
                    },
                    documentation = {
                        border = 'rounded',
                    }
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort,
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if has_words_before() and cmp.visible() then
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true
                            })
                        else
                            fallback()
                        end
                    end, {"i", "s"})
                }),
                sources = cmp.config.sources({
                    {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'},
                    {name = 'path'},
                }),
                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symnol_text",
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]"
                        })
                    })
                },
                view = {
                    entries = {name = "custom", selection_order = "near_cursor"}
                }
            }
        end
    },
    {"onsails/lspkind.nvim", lazy = true, dependencies = {"hrsh7th/nvim-cmp"}}
}
