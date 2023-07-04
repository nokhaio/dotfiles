local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

  vim.cmd [[packadd packer.nvim]]

  packer.startup(function(use)
    -- Packer сам себя
    use 'wbthomason/packer.nvim'

    -----------------------------------------------------------
    -- ПЛАГИНЫ ВНЕШНЕГО ВИДА
    -----------------------------------------------------------

    -- Цветовая схема
    use 'navarasu/onedark.nvim'
    use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
    -- use {
    --     'svrana/neosolarized.nvim',
    --     requires = { 'tjdevries/colorbuddy.nvim' }
    -- }
    -- use ('Tsuzat/NeoSolarized.nvim')
    --- Информационная строка внизу
    use  'nvim-lualine/lualine.nvim'
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'neovim/nvim-lspconfig'  -- LSP
    use 'hrsh7th/cmp-nvim-lsp'  -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/cmp-buffer'  -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'  -- Completion
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'glepnir/lspsaga.nvim' -- LSP UIs


    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets' -- snippets   
    use {
       'nvim-treesitter/nvim-treesitter',
       run = ':TSUpdate'
    } 
    use 'kyazdani42/nvim-web-devicons' -- File icons

    -- Telescope
    -- use 'nvim-telescope/telescope.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      require = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-file-browser.nvim'
    -- fuzzy finding
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } -- dependency for better sorting performance

    -- AutoTAG and Atopair
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    -- Auto Save
    use({
          "Pocco81/auto-save.nvim",
          config = function()
                  require("auto-save").setup {
			          -- your config goes here
			          -- or just leave it empty :)
		              }
	        end,
    })
    -- Comment
    use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup()
          end
    }
    -- Indent Blankline
    use "lukas-reineke/indent-blankline.nvim"
    -- Markdown Preview
    use({
           "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

end)
