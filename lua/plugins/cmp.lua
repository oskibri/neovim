local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = cmp.mapping.preset.insert({
        -- Scroll docs
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        --['<C-f>'] = cmp.mapping.scroll_docs(4),

        -- Trigger completion
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Close completion menu
        ['<C-e>'] = cmp.mapping.abort(),

        -- Confirm selection
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Navigate items (up/down)
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),

    sources = cmp.config.sources(
        {{ name = 'nvim_lsp' }, { name = 'luasnip' }}, 
        {{ name = 'path' },{ name = 'buffer' }}
    ),
})
