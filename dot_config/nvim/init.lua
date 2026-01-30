print("~/.config/nvim/init.lua has loaded")

require("config.lazy")

local set = vim.opt

set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.number = true
set.clipboard = 'unnamedplus'

vim.keymap.set("i", "fd", "<ESC>")
vim.keymap.set("n", "<space>fo", function() vim.lsp.buf.format() end)

vim.keymap.set("n", "<space><space>x", ":source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", vim.cmd.cnext)
vim.keymap.set("n", "<M-k>", vim.cmd.cprevious)

vim.keymap.set("n", "<space>tt", "<cmd>term<CR>")
vim.keymap.set("n", "<space>tj", "<cmd>botright split | term<CR>")
vim.keymap.set("n", "<space>tl", "<cmd>botright vsplit | term<CR>")

-- vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")
vim.keymap.set("t", "fd", "<C-\\><C-N>")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text.",
  group = vim.api.nvim_create_augroup("pmacho-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
