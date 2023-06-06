-- This file can be loaded by calling `lua require('plugins')` from your init.vim
print('init plugins')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.api.nvim_set_keymap("n", "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})

function search_word_all()
    local input_string = vim.fn.input("Search For > ")
        if (input_string == '') then
          return
        end
        builtin.grep_string({
          search = input_string,
    })
end
vim.keymap.set('n', '<leader>fa', search_word_all, {})


return require('packer').startup(function(use)
  -- packers
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
}
  use {'neoclide/coc.nvim', branch = 'release'}

  -- navigation
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
   requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use "smartpde/telescope-recent-files"
  use "preservim/nerdtree"


  -- ts
  use "leafgarland/typescript-vim"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use {
    "prettier/vim-prettier",
    run='npx yarn install --frozen-lockfile --production'
  }
  use "neovim/nvim-lspconfig"
  use "marilari88/twoslash-queries.nvim"
  use "jiangmiao/auto-pairs"

  -- other languages
  use "wuelnerdotexe/vim-astro"

end)
