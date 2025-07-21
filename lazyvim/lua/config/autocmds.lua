-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    -- vim.keymap.set("n", "<C-h>", ":w<CR>:!make; ./*.out<CR>", { buffer = true, silent = true })
    -- vim.keymap.set("i", "<C-h>", "<Esc>:w<CR>:!make; ./*.out<CR>", { buffer = true, silent = true })
    vim.keymap.set("n", "<C-h>", ":w<CR>:!make<CR>", { buffer = true, silent = true })
    vim.keymap.set("i", "<C-h>", "<Esc>:w<CR>:!make<CR>", { buffer = true, silent = true })
  end,
})

-- Автокоманда для файлов C и C++
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp" }, -- Применять для файлов C и C++
  callback = function()
    vim.opt_local.tabstop = 4 -- Устанавливаем tabstop = 4
    vim.opt_local.shiftwidth = 4 -- Устанавливаем shiftwidth = 4
    vim.opt_local.expandtab = false -- Преобразуем табуляции в пробелы
  end,
})

-- Автосохранение файлов
-- vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent write")
    end
  end,
})
