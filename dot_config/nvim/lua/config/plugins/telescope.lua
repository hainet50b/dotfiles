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

      vim.keymap.set("n", "<Space>fe", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config'),
        }
      end)
      vim.keymap.set("n", "<Space>fE", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config'),
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<Space>ff", function()
        require('telescope.builtin').find_files()
      end)
      vim.keymap.set("n", "<Space>fF", function()
        require('telescope.builtin').find_files {
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<Space>fh", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.expand('~'),
        }
      end)
      vim.keymap.set("n", "<Space>fH", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.expand('~'),
          hidden = true,
        }
      end)
      vim.keymap.set("n", "<Space>fb", function()
        require('telescope.builtin').buffers()
      end)
      vim.keymap.set("n", "<Space>fp", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
          hidden = true,
        }
      end)

      vim.keymap.set("n", "<Space>hh", function()
        require('telescope.builtin').help_tags()
      end)
      vim.keymap.set("n", "<Space>hm", function()
        require('telescope.builtin').man_pages()
      end)
      vim.keymap.set("n", "<Space>hk", function()
        require('telescope.builtin').keymaps()
      end)

      require "config.telescope.multigrep".setup()
    end,
  },
}
