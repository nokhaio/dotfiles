-- Автосохранение файлов
-- vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost" }, {
	pattern = "*",
	callback = function()
		local filename = vim.fn.expand("%:p")
		if vim.bo.modified and filename ~= "" and vim.fn.filereadable(filename) then
			vim.cmd("silent write")
		end
	end,
})
