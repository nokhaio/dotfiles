local map = vim.keymap.set

-- map("n", "<leader>e", "<Cmd>Explore<CR>")

-- local fzf = require("fzf-lua")

-- vim.keymap.set("n", "<leader><leader>", fzf.files)
-- vim.keymap.set("n", "<leader>/", fzf.live_grep)

local opts = { noremap = true, silent = true }

-- vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- vim.keymap.set("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)

map("n", ",<SPACE>", ":nohlsearch<CR>", opts)


-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })


-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
map("x", "<", "<gv")
map("x", ">", ">gv")

-- windows
map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

map("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
		async = true,
	})
end, { desc = "Format buffer" })


-- Snacks
-- Top Pickers & Explorer
map('n', "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
map('n', "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map('n', "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
map('n', "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
map('n', "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
map('n', "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
-- find
map('n', "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map('n', "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
	{ desc = "Find Config File" })
map('n', "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
map('n', "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
map('n', "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
map('n', "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
-- git
map('n', "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map('n', "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map('n', "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map('n', "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map('n', "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map('n', "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map('n', "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
-- 	-- gh
map('n', "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" })
map('n', "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end,
	{ desc = "GitHub Issues (all)" })
map('n', "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" })
map('n', "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,
	{ desc = "GitHub Pull Requests (all)" })
-- 	-- Grep
map('n', "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map('n', "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map('n', "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
map({ 'n', 'x' }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
-- 	-- search
map('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" })
map('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" })
map('n', "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
map('n', "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map('n', "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
map('n', "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
map('n', "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map('n', "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map('n', "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
map('n', "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
map('n', "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
map('n', "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
map('n', "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
map('n', "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
map('n', "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
map('n', "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
map('n', "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
map('n', "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
map('n', "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
map('n', "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- Other
map('n', "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
map('n', "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
map('n', "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map('n', "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
map('n', "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
map('n', "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
map('n', "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
-- map('n', 'v', "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map('n', "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map('n', "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
map('n', "<c-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
map('n', "<c-_>", function() Snacks.terminal() end, { desc = "which_key_ignore" })
map({ 'n', 't' }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ 'n', 't' }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
map('n', "<leader>N",
	function()
		Snacks.win({
			file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
			width = 0.6,
			height = 0.6,
			wo = {
				spell = false,
				wrap = false,
				signcolumn = "yes",
				statuscolumn = " ",
				conceallevel = 3,
			},
		})
	end,

	{ desc = "Neovim News", })
--
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local opts = { buffer = ev.buf }


		if _G.Snacks then
			map('n', '<leader>cl', function() Snacks.picker.lsp_config() end, { desc = "Lsp Info", buffer = ev.buf })
			-- 	-- LSP
			map('n', "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
			map('n', "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
			map('n', "gr", function() Snacks.picker.lsp_references() end,
				{ nowait = true, desc = "References" })
			map('n', "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
			map('n', "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
			map('n', "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
			map('n', "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
			map('n', "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
			map('n', "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end,
				{ desc = "LSP Workspace Symbols" })
			--
		end
	end,
})
