local g = vim.g
local api = vim.api
local keymap = vim.keymap

g.mapleader = " "

api.nvim_create_user_command("W", ":w", {})

keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
