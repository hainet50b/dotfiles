return {
  {
    "nvim-mini/mini.nvim",
    enabled = true,
    version = false,
    config = function() require('mini.statusline').setup() end,
  },
}
