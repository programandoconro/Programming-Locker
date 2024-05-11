-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- packers
  use 'wbthomason/packer.nvim'

  -- autocomple, go to reference/declaration
  use {'neoclide/coc.nvim', branch = 'release'}

  -- navigation
  use {
  'nvim-telescope/telescope.nvim',
   requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use "smartpde/telescope-recent-files"

  -- file explorer
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

  -- git
  use "tpope/vim-fugitive"

  -- Rename var globally
  use {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
}


  -- astro
  use 'wuelnerdotexe/vim-astro'

  --Style
  use 'Mofiqul/dracula.nvim'

  --Markdown
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  --Terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}

--- Update imports when renaming a file
use {
  "antosha417/nvim-lsp-file-operations",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    require("lsp-file-operations").setup()
  end,
}
  

end)
