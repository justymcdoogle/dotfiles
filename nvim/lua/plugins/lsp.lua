return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Setup each server using the new API
    vim.lsp.config.clangd = { capabilities = capabilities }
    vim.lsp.config.pyright = { capabilities = capabilities }
    vim.lsp.config.html = { capabilities = capabilities }
    vim.lsp.config.cssls = { capabilities = capabilities }
    vim.lsp.config.ts_ls = { capabilities = capabilities }
    vim.lsp.config.kotlin_language_server = {
      capabilities = capabilities,
      -- This tells the LSP where the project starts so it can find the classpath
      init_options = {
        storagePath = vim.fn.stdpath("cache") .. "/kotlin-lsp"
      },
      root_dir = vim.fs.root(0, { "settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts", ".git" }),
      settings = {
        kotlin = {
          compiler = { jvm = { target = "17" } },
          indexing = { enabled = true },
        },
      },
    }
    -- Enable all servers
    vim.lsp.enable('clangd')
    vim.lsp.enable('pyright')
    vim.lsp.enable('html')
    vim.lsp.enable('cssls')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('kotlin_language_server')

    -- Keybinds
    vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename symbol" })
  end,
}
