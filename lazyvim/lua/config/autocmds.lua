-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Файл: ~/.config/nvim/lua/config/autocommands.lua

-- Автокоманда для файлов C и C++
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"c", "cpp"},  -- Применять для файлов C и C++
  callback = function()
    vim.opt_local.tabstop = 4      -- Устанавливаем tabstop = 4
    vim.opt_local.shiftwidth = 4   -- Устанавливаем shiftwidth = 4
    vim.opt_local.expandtab = false -- Преобразуем табуляции в пробелы
  end,
})

-- Автосохранение файлов
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
    pattern = "*",
    callback = function()
        if vim.bo.modified then
            vim.cmd("silent write")
        end
    end,
})

-- Настройка форматирования с помощью
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h", "*.cpp", "*.hpp" },
  callback = function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("%!c_formatter_42")
    vim.api.nvim_win_set_cursor(0, cursor_pos)

  end,
})
