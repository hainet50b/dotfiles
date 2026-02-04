return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = 'ivy'
          },
          buffers = {
            theme = 'ivy'
          },
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local builtin = require('telescope.builtin')

      vim.keymap.set(
        "n", "<Space>fe", function()
          builtin.find_files {
            cwd = vim.fn.stdpath('config'),
          }
        end,
        { desc = "Find files in Neovim config directory" }
      )
      vim.keymap.set(
        "n", "<Space>fE", function()
          builtin.find_files {
            cwd = vim.fn.stdpath('config'),
            hidden = true,
          }
        end,
        { desc = "Find files in Neovim config directory (including dotfiles)" }
      )
      vim.keymap.set(
        "n", "<Space>ff", function()
          builtin.find_files()
        end,
        { desc = "Find files in current directory" }
      )
      vim.keymap.set(
        "n", "<Space>fF", function()
          builtin.find_files {
            hidden = true,
          }
        end,
        { desc = "Find files in current directory (including dotfiles)" }
      )
      vim.keymap.set(
        "n", "<Space>fh", function()
          builtin.find_files {
            cwd = vim.fn.expand('~'),
          }
        end,
        { desc = "Find files in home directory" }
      )
      vim.keymap.set(
        "n", "<Space>fH", function()
          builtin.find_files {
            cwd = vim.fn.expand('~'),
            hidden = true,
          }
        end,
        { desc = "Find files in home directory (including dotfiles)" }
      )
      vim.keymap.set(
        "n", "<Space>fb", function()
          builtin.buffers()
        end,
        { desc = "Find buffers" }
      )
      vim.keymap.set(
        "n", "<Space>fp", function()
          builtin.find_files {
            cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
            hidden = true,
          }
        end,
        { desc = "Find files in installed packages (lazy.nvim)" }
      )

      vim.keymap.set(
        "n", "<Space>hh", function()
          builtin.help_tags()
        end,
        { desc = "Find help tags" }
      )
      vim.keymap.set(
        "n", "<Space>hm", function()
          builtin.man_pages()
        end,
        { desc = "Find man pages" }
      )
      vim.keymap.set(
        "n", "<Space>hk", function()
          builtin.keymaps()
        end,
        { desc = "Find keymaps" }
      )

      require "config.telescope.multigrep".setup()
    end,
  },
}
