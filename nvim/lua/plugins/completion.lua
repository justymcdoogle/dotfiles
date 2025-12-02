return {
  "hrsh7th/nvim-cmp",
  -- load cmp on InsertEnter
  event = "InsertEnter",
  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
	['<C-Space>'] = cmp.mapping.complete(),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      })
    })
  end,
}

