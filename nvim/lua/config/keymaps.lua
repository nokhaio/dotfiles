-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local options = { silent = true }

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
keymap("i", "jj", "<ESC>", options)

-- New tab
keymap("n", "te", ":tabedit")
keymap("n", "<tab>", ":tabnext<Return>")
keymap("n", "<s-tab", ":tabprev<Return>")
-- Split window
keymap("n", "ss", ":split<Return>")
keymap("n", "sv", ":vsplit<Return>")
-- Move window
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")
