if vim.g.vscode then
  -- VSCode extension
  -- require("config.lazyvscode")
  require("config.vscode")
else
  -- bootstrap lazy.nvim, LazyVim and your plugins
  require("config.lazy")
  -- require("ft_count").setup()

end
