return {
  "abidibo/nvim-httpyac",
  config = function()
    require('nvim-httpyac').setup {
      output_view = 'vertical'
    }

    vim.keymap.set('n', '<Space>rr', function()
      vim.cmd('NvimHttpYac')
    end)
    vim.keymap.set('n', '<Space>ra', function()
      vim.cmd('NvimHttpYacAll')
    end)
    vim.keymap.set('n', '<Space>rp', function()
      vim.cmd('NvimHttpYacPicker')
    end)
  end,
}
