-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",,", ":NvimTreeToggle<cr>") -- toggle nerdtree
map("n", "zz", "<ESC>:update<cr>") -- format and save file
map("n", "<C-s>","<C-^>") -- toggle last file
map("n", "ff", ":Prettier<cr>") -- format file 
map("i", "jk", "<ESC>") --remap escape to jk
map("n", "tt", ":ToggleTerm<cr>") --toggle terminal
map("n", "TT", ":ToggleTermToggleAll<cr>") --toggle terminal
map("n", "mm", ":Files<cr>") --search file by name
map("n", "<leader>fc", ":Rg<cr>") --search word everywhere
-- move between panels
map("n", "<C-j>", "<C-W>j") 
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

map("n", ";", "<S-$>") -- Go to end of line

map("t", "jk", "<C-\\><C-n>") -- exit terminal mode

-- TERMINAL LAZYGIT 
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("startinsert!")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- TELESCOPE 
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

