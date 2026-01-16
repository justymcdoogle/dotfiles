return {
  -- Mason - LSP installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Mason-lspconfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- List of servers you want auto-installed
        ensure_installed = {
          "clangd",                       -- C/C++
          "pyright",                      -- Python
          "html",                         -- HTML
          "cssls",                        -- CSS (optional)
          "ts_ls",                        -- TypeScript/JavaScript
          "kotlin_language_server",       -- Kotlin
        },
        automatic_installation = true,
      })
    end,
  },
}
