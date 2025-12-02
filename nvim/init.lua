vim.g.mapleader = " "
require("config.lazy")

-- General indention settings
vim.opt.expandtab = true    -- Use spaces instead of tabs
vim.opt.shiftwidth = 4      -- Default indent size
vim.opt.tabstop = 4         -- Tab display width

-- Line number settings
vim.opt.number = true       -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Lua-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
  end,
})

