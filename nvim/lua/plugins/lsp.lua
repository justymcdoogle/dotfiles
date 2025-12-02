return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Setup clangd for C
    vim.lsp.config.clangd = {
      capabilities = capabilities,
    }

    -- Setup pyright for Python
    vim.lsp.config.pyright = {
      capabilities = capabilities,
    }

    -- Enable the language services
    vim.lsp.enable('clangd')
    vim.lsp.enable('pyright')
    
    -- My keybinds
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename symbol" })

  end,

}
