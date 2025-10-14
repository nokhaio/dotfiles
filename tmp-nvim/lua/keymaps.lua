-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local options = { silent = true }

-- turn off search highlight
keymap("n", ",<SPACE>", ":nohlsearch<CR>", options)

--keymap('n', '<leader>vr', ':so %<CR>')
keymap("n", ",vr", ":so %<CR>")

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
keymap("i", "jj", "<ESC>", options)
--
keymap("i", "<C-e>", "")

-- Move selected line / block of text in visual mode
--keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", options)

--keymap('v', '"y', '"*y', options)
--keymap('n', '"y', '"*y', options)
--keymap('n', '"Y', '"*Y', options)
--keymap('n', '"p', '"*p', options)
--keymap('n', '"P', '"*P', options)

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

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

-- Quotation mark around a word
keymap("n", '""', 'viw<ESC>a"<ESC>hbi"<ESC>lel')
keymap("n", "''", "viw<ESC>a'<ESC>hbi'<ESC>lel")
