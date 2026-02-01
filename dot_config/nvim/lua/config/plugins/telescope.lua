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

      vim.keymap.set("n", "<space>fe", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config'),
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<space>ff", function()
        require('telescope.builtin').find_files {
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<space>fh", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.expand('~'),
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<space>fb", function()
        require('telescope.builtin').buffers()
      end)

      vim.keymap.set("n", "<space>fH", function()
        require('telescope.builtin').help_tags()
      end)
      vim.keymap.set("n", "<space>fp", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
          hidden = true,
        }
      end)

      require "config.telescope.multigrep".setup()
    end,
  },
}
