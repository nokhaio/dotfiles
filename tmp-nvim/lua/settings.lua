vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
vim.opt.clipboard = "unnamed,unnamedplus"  -- Copy-paste between vim and everything else
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '79'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
-- vim.opt.signcolumn = 'yes:1'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.hlsearch = true
-- vim.opt.backup = false
-- vim.opt.showcmd = true
-- vim.opt.cmdheight = 1
-- vim.opt.laststatus = 2
vim.opt.expandtab = true  -- use spaces instead of tabs
vim.opt.smarttab = true
vim.opt.tabstop = 4  -- 1 tab == 4 spaces
vim.opt.shiftwidth = 4  -- shift 4 spaces when tab
--vim.opt.shell = 'fish'


-- 2 spaces for selected filetypes
vim.cmd ([[autocmd FileType xml,html,xhtml,css,scss,javascript,json,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2]])

-- Подсвечивает на доли секунды скопированную часть текста
--vim.api.nvim_exec([[
--augroup YankHighlight
--autocmd!
--autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
--augroup end
--]], false)

-- Highlight on yank  ТОЖЕ САМОЕ ЧТО СВЕРХУ
vim.api.nvim_create_autocmd("TextYankPost",
  { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 }) end })

