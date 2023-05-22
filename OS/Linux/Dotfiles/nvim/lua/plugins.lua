-- This file can be loaded by calling `lua require('plugins')` from your init.vim
print('init plugins')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
   requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "smartpde/telescope-recent-files"
  use "jiangmiao/auto-pairs"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "preservim/nerdtree"
  use {
    "prettier/vim-prettier",
    run='npx yarn install --frozen-lockfile --production'
  }
  use "wuelnerdotexe/vim-astro"
end)
