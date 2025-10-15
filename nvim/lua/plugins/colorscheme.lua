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

-- Boda local for develop
return {
	dir = "~/projects/theme-ayu/boda.nvim/", -- локальный путь до твоей темы
	lazy = false, -- чтобы загрузилась сразу
	priority = 1000, -- чтобы тема применилась раньше других
	config = function()
		-- Настройка темы
		require("ayu").setup({
			mirage = false, -- true для темной версии mirage
			terminal = true,
			overrides = {}, -- кастомные настройки
		})
		-- Установка цветовой схемы
		require("ayu").colorscheme()
	end,
}
