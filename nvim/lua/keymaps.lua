local keymap = vim.keymap.set
local options = { silent = true }

-- turn off search highlight
keymap("n", ",<SPACE>", ":nohlsearch<CR>", options)

-- coment line
keymap("n", "C-i", "norm ^i#")

--keymap('n', '<leader>vr', ':so %<CR>')
keymap('n', ',vr', ':so %<CR>')

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
keymap('i', 'jj', '<ESC>', options)
--
keymap('i', '<C-e>', '')

-- Move selected line / block of text in visual mode
--keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

--keymap('v', '"y', '"*y', options)
--keymap('n', '"y', '"*y', options)
--keymap('n', '"Y', '"*Y', options)
--keymap('n', '"p', '"*p', options)
--keymap('n', '"P', '"*P', options)


-- Select all
keymap('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap('n', 'te', ':tabedit ')
keymap('n', 'tnw', ':tabnew D:\\work_dir\\<CR>')
keymap('n', 'tnh', ':tabnew $HOME<CR>')
keymap('n', 'tnc', ':tabnew $HOME\\.config\\nvim\\<CR>')

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w')
keymap('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
keymap('n', '<Space>', '<C-w>w')
keymap('', 'sh', '<C-w>h')
keymap('', 'sk', '<C-w>k')
keymap('', 'sj', '<C-w>j')
keymap('', 'sl', '<C-w>l')

