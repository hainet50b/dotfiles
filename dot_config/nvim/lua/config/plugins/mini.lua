return {
  {
    "nvim-mini/mini.nvim",
    enabled = true,
    version = false,
    config = function()
      -- mini.statusline
      require('mini.statusline').setup()

      -- mini.animate
      local mouse_scrolled = false
      for _, dir in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. dir .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require('mini.animate')
      animate.setup {
        cursor = {
          enable = false,
        },
        scroll = {
          timing = animate.gen_timing.linear({
            duration = 80,
            unit = 'total',
          }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              else
                return total_scroll > 1
              end
            end,
          })
        },
      }

      -- mini.map
      require('mini.map').setup {
        window = {
          focusable = true,
        },
      }
      vim.api.nvim_set_hl(0, "MiniMapNormal", { fg = "#555555" })
      vim.api.nvim_set_hl(0, "MiniMapSymbolLine", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "MiniMapSymbolView", { fg = "#aaaaaa" })
      vim.keymap.set(
        "n", "<Space>mm", function()
          MiniMap.toggle()
        end,
        { desc = "Toggle mini map (mini.map)" }
      )
    end,
  },
}
