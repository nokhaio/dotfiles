
-- Options  -----

vim.opt.autoindent = true   -- Сохранять отступ текущей строки
vim.opt.smartindent = true  -- «Умные» отступы (для C-подобных языков)
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


-- Автокоманда для файлов C и C++
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "cpp", 'py'},  -- Применять для файлов C и C++
  callback = function()
    vim.opt_local.tabstop = 4      -- Устанавливаем tabstop = 4
    vim.opt_local.shiftwidth = 4   -- Устанавливаем shiftwidth = 4
    vim.opt_local.expandtab = false -- Преобразуем табуляции в пробелы
  end,
})




-- Keymaps ------

local keymap = vim.keymap.set
local options = { silent = true }

-- remap leader key
keymap("n", "<Space>", "", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- turn off search highlight
keymap("n", ",<SPACE>", ":nohlsearch<CR>", options)

--keymap('n', '<leader>vr', ':so %<CR>')
keymap("n", ",vr", ":so %<CR>")

-- Типа 'Нажимает' на ESC при быстром нажатии jj, чтобы не тянутся
keymap("i", "jj", "<ESC>", options)
--
keymap("i", "<C-e>", "")

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", options)
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


-- keymap vscode
-- call vscode commands from neovim

-- general keymaps
keymap({"n", "v"}, "gd", "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>")
keymap({"n", "v"}, "<leader>cr", "<cmd>lua require('vscode').action('editor.action.rename')<CR>")
keymap({"n", "v"}, "gB", "<cmd>lua require('vscode').action('workbench.action.navigateBack')<CR>")
keymap({"n", "v"}, "<leader>ss", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
-- keymap({"n", "v"}, "<leader>t", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
-- keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
-- keymap({"n", "v"}, "<leader>a", "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({"n", "v"}, "<leader>xx", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
-- keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
-- keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
-- keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
-- keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({"n", "v"}, "<leader>cf", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
----
-- -- harpoon keymaps
-- keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
-- keymap({"n", "v"}, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
-- keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
-- keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
-- keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
-- keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
-- keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
-- keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
-- keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
-- keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
-- keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
-- keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")
--
-- -- project manager keymaps
-- keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
-- keymap({"n", "v"}, "<leader>po", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
-- keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")
