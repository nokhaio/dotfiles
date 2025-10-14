return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    -- LazyVim config for treesitter
    indent = { enable = true }, ---@type lazyvim.TSFeat
    highlight = { enable = true }, ---@type lazyvim.TSFeat
    folds = { enable = true }, ---@type lazyvim.TSFeat
    ensure_installed = {
      -- "bash",
      -- "c",
      -- "cpp",
      -- "diff",
      -- "html",
      -- "javascript",
      -- "jsdoc",
      -- "json",
      "json5",
      -- "jsonc",
      "lua",
      -- "luadoc",
      -- "luap",
      "markdown",
      -- "markdown_inline",
      -- "printf",
      "python",
      -- "query",
      -- "regex",
      "toml",
      -- "tsx",
      -- "typescript",
      -- "vim",
      -- "vimdoc",
      -- "xml",
      "yaml",
    },
  },
}
