return {
  "windwp/nvim-ts-autotag",
  opts = {
    aliases = {
      ["htmldjango"] = "html",
    },
    -- This allows you to restrict it to specific filetypes
    opts = {
      enable_close = true,           -- Auto close tags
      enable_rename = true,          -- Auto rename pairs of tags
      enable_close_on_slash = false, -- Auto close on trailing </
    },
    -- If you ONLY want it for html files:
    filetypes = { "html", "xml" }, 
  },
}
