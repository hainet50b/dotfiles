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
      keymaps = {
        ["<Esc>"] = { "actions.close", mode = "n" },
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        max_width = 0.85,
        max_height = 0.85,
        border = "single",
        preview_split = "right",
      },
      preview = {
      },
    }

    local oil = require('oil')

    vim.keymap.set(
      "n", "<Space>ee", function()
        oil.open_float(vim.fn.stdpath("config"), {
          preview = {
          },
        })
      end,
      { desc = "Open Neovim config directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>ed", function()
        oil.open_float(vim.uv.cwd(), {
          preview = {
          },
        })
      end,
      { desc = "Open current directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>ef", function()
        oil.open_float(vim.fn.expand("%:p:h"), {
          preview = {
          },
        })
      end,
      { desc = "Open current file directory in explorer (oil.nvim)" }
    )
    vim.keymap.set(
      "n", "<Space>eh", function()
        oil.open_float(vim.fn.expand("~"), {
          preview = {
          },
        })
      end,
      { desc = "Open home directory in explorer (oil.nvim)" }
    )
  end,
}
