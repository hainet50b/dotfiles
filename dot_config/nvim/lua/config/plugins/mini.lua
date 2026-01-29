return {
  {
    "nvim-mini/mini.nvim",
    enabled = true,
    version = false,
    config = function()
      require('mini.statusline').setup()

      require('mini.map').setup {
        window = {
          focusable = true,
        },
      }
      vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = "#555555" })
      vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#aaaaaa" })
      vim.keymap.set("n", "<space>mm", function()
        MiniMap.toggle()
      end)
    end,
  },
}
