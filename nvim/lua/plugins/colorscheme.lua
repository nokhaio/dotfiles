-- Colors:
-- Black: #0A0E14
-- Grey: #B3B1AD
-- Light grey: #B3B1ADBF // 75% alpha
-- Yellow: #E6B450
-- Orange: #FFB454
-- Red: #FF8F40
-- Blue: #59C2FF

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

-- Ayu local for develop
return {
  {
    dir = "~/projects/theme-ayu/boda.nvim/", -- локальный путь до твоей темы
    name = "ayu", -- имя плагина
    lazy = false, -- чтобы загрузилась сразу
    priority = 1000, -- чтобы тема применилась раньше других
    config = function()
      -- Настройка темы
      require("ayu").setup({
        mirage = false, -- true для темной версии mirage
        overrides = {}, -- кастомные настройки
      })
      -- Установка цветовой схемы
      vim.cmd.colorscheme("ayu")
    end,
  },
}
