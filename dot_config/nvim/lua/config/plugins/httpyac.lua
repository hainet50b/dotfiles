return {
  "abidibo/nvim-httpyac",
  config = function()
    require('nvim-httpyac').setup {
      output_view = 'vertical'
    }

    vim.keymap.set(
      'n', '<Space>rr', function()
        vim.cmd('NvimHttpYac')
      end,
      { desc = "Run request under cursor (httpYac)" }
    )
    vim.keymap.set(
      'n', '<Space>ra', function()
        vim.cmd('NvimHttpYacAll')
      end,
      { desc = "Run all requests in current file (httpYac)" }
    )
    vim.keymap.set(
      'n', '<Space>rp', function()
        vim.cmd('NvimHttpYacPicker')
      end,
      { desc = "Run request selected from picker (httpYac)" }
    )
  end,
}
