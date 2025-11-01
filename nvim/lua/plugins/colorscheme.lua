local Path = vim.fn.stdpath("data") .. "~/projects/theme-ayu/boda.nvim"

if vim.fn.isdirectory(Path) == 1 then
	-- Boda local for develop
	return {
		-- dir = "~/projects/theme-ayu/boda.nvim/", -- локальный путь до твоей темы
		Path,
		lazy = false, -- чтобы загрузилась сразу
		priority = 1000, -- чтобы тема применилась раньше других
		config = function()
			-- Настройка темы
			require("boda").setup({
				mirage = false, -- true для темной версии mirage
				terminal = true,
				overrides = {}, -- кастомные настройки
			})
			-- Установка цветовой схемы
			require("boda").colorscheme()
		end,
	}
else
	return {
		"nokhaio/boda.nvim",

		name = "boda",
		lazy = false,
		priority = 1000,
		config = function()
			require("boda").setup({
				mirage = false,
				terminal = true,
				overrides = {},
			})
			require("boda").colorscheme()
		end,
	}
end

-- ============================================================================
-- Ayu
-- return {
--   {
--     "Shatur/neovim-ayu",
--     lazy = false,    -- Загружать сразу
--     priority = 1000, -- Высокий приоритет
--     config = function()
--       -- Настройка темы
--       require('ayu').setup({
--         mirage = false, -- true для темной версии mirage
--         overrides = {}, -- кастомные настройки
--       })
--       -- Установка цветовой схемы
--       vim.cmd.colorscheme('ayu')
--     end,
--   }
-- }
