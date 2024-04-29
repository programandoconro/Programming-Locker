-- This file can be loaded by calling `lua require('plugins')` from your init.vim

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

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })


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
  use "preservim/nerdtree"

  -- git
  use "tpope/vim-fugitive"

  -- Rename var globally
  use {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup()
  end,
}


  --Style
  use 'Mofiqul/dracula.nvim'

  --Terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}



end)
