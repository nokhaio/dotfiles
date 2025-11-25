return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false, -- отключаем virtual_text, вывод информации LSP, прямо в редакторе
    },
  },
}
