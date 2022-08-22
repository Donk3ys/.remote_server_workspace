-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- icons
local lspkind = require('donk3y.lspkind')

local cmp = require'cmp'
cmp.setup({
    snippet = {
    expand = function(args)
			require'luasnip'.lsp_expand(args.body)
    end,
  },

	mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
     ['<S-TAB>'] = cmp.mapping.select_prev_item(),
     ['<TAB>'] = cmp.mapping.select_next_item(),
--   	['<S-TAB>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
-- 		['<TAB>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
	},

	formatting = {
	   format = lspkind.cmp_format({with_text = false, maxwidth = 50})
	},

	experimental = {
		native_menu = false,
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
	},

})