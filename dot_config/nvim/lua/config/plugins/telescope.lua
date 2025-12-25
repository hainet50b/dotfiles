return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      vim.keymap.set("n", "<space>fh", function()
        require('telescope.builtin').help_tags()
      end)
      vim.keymap.set("n", "<space>fd", function()
        require('telescope.builtin').find_files()
      end)
      vim.keymap.set("n", "<space>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config')
        }
      end)
    end,
  },
}
