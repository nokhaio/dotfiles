local blink_config = require('plugins.blink')


vim.pack.add({
	{ src = "https://github.com/nokhaio/boda.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
})




require("boda").colorscheme()
require("mason").setup({})
require("lualine").setup({})
require("blink.cmp").setup(blink_config)
require("snacks").setup({
	bigfile = { enabled = true },
	-- dashboard = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,

		sources = {
			explorer = {
				layout = { layout = { position = "right" } },
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		}
	}
})


require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "prettierd", "prettier", stop_after_first = true },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
