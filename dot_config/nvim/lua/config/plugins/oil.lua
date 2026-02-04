return {
  'stevearc/oil.nvim',
  dependencies = {
    { 'nvim-mini/mini.icons', opts = {} },
  },
  lazy = false,
  config = function()
    require('oil').setup {
      columns = {
        'icon',
      },
    }

    local oil = require('oil')

    vim.keymap.set(
      "n", "<Space>ee", function()
        oil.open_float(vim.fn.stdpath("config"))
      end,
      { desc = "Open Neovim config directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>ed", function()
        oil.open_float(vim.uv.cwd())
      end,
      { desc = "Open current directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>ef", function()
        oil.open_float()
      end,
      { desc = "Open current file directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>eh", function()
        oil.open_float(vim.fn.expand("~"))
      end,
      { desc = "Open home directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>ec", function()
        oil.close()
      end,
      { desc = "Close explorer (oil.nvim)" }
    )
  end,
}
