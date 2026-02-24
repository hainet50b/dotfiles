-- Plugin
require("config.lazy")

-- Title
vim.opt.title = true
vim.opt.titlestring = "%t"

-- Editor
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = 'lead:·,trail:·'

-- Search and Highlight
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<Space>nhl", vim.cmd.nohlsearch)

-- Clipboard
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text.",
  group = vim.api.nvim_create_augroup("pmacho-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Mode
vim.keymap.set("i", "fd", "<Esc>")
-- vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")
vim.keymap.set("t", "fd", "<C-\\><C-N>")

-- Lua
vim.keymap.set("n", "<Space><Space>x", ":source %<cr>")
vim.keymap.set("n", "<Space>x", ":.lua<cr>")
vim.keymap.set("v", "<Space>x", ":lua<cr>")

-- LSP
vim.keymap.set("n", "<Space>fo", function() vim.lsp.buf.format() end)

-- Window
vim.keymap.set("n", "<Space>ww", function()
  vim.api.nvim_command("enew")
end)
vim.keymap.set("n", "<Space>wl", function()
  vim.cmd.vsplit()
  vim.cmd.wincmd("l")
end)
vim.keymap.set("n", "<Space>wh", vim.cmd.vsplit)
vim.keymap.set("n", "<Space>wj", function()
  vim.cmd.split()
  vim.cmd.wincmd("j")
end)
vim.keymap.set("n", "<Space>wk", vim.cmd.split)

-- Terminal
vim.keymap.set("n", "<Space>tt", vim.cmd.term)
vim.keymap.set("n", "<Space>tj", function()
  vim.cmd("belowright split")
  vim.cmd.term()
end)
vim.keymap.set("n", "<Space>tk", function()
  vim.cmd.split()
  vim.cmd.term()
end)
vim.keymap.set("n", "<Space>tl", function()
  vim.cmd("belowright vsplit")
  vim.cmd.term()
end)
vim.keymap.set("n", "<Space>th", function()
  vim.cmd.vsplit()
  vim.cmd.term()
end)

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start terminal in insert mode",
  group = vim.api.nvim_create_augroup("pmacho-term-insert-mode", { clear = true }),
  callback = function()
    vim.cmd.startinsert()
  end,
})

-- Quickfix
vim.keymap.set("n", "<M-j>", vim.cmd.cnext)
vim.keymap.set("n", "<M-k>", vim.cmd.cprevious)
