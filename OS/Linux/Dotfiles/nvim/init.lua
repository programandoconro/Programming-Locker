require('plugins')
require('coc')
--require('nerdtree')
--require("telescope").load_extension("recent_files")
require("remaps")
--require("mason").setup()
--require("lsp")
require("toggleterm").setup{}


vim.cmd[[colorscheme dracula]]

vim.cmd('source ~/.config/nvim/config.vim')

vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"


-- Nvim tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})







