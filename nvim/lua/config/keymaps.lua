-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local options = { silent = true }

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
keymap("i", "jj", "<ESC>", options)
