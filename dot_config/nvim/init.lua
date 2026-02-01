-- Plugin
require("config.lazy")

-- Title
vim.opt.title = true
vim.opt.titlestring = "%t"

-- Editor
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = 'lead:·,trail:·'

-- Search and Highlight
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n", "<space>nhl", vim.cmd.nohlsearch)

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
vim.keymap.set("n", "<space><space>x", ":source %<cr>")
vim.keymap.set("n", "<space>x", ":.lua<cr>")
vim.keymap.set("v", "<space>x", ":lua<cr>")

-- LSP
vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format() end)

-- Window
vim.keymap.set("n", "<space>wj", function()
  vim.cmd.split()
  vim.cmd.wincmd("j")
end)
vim.keymap.set("n", "<space>wl", function()
  vim.cmd.vsplit()
  vim.cmd.wincmd("l")
end)

-- Terminal
vim.keymap.set("n", "<space>tt", vim.cmd.term)
vim.keymap.set("n", "<space>tj", function()
  vim.cmd("botright split")
  vim.cmd.term()
end)
vim.keymap.set("n", "<space>tl", function()
  vim.cmd("botright vsplit")
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
