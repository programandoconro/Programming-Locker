-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", ",,", ":NERDTreeToggle<cr>") -- toggle nerdtree
map("n", "zz", ":Prettier<cr> <ESC>:update<cr>") -- format and save file
map("n", "<C-s>","<C-^>") -- toggle last file
map("n", "ff", ":Prettier<cr>") -- format file 
map("i", "jk", "<ESC>") --remap escape to jk
map("n", "tt", ":ToggleTerm<cr>") --toggle terminal
map("n", "mm", ":Files<cr>") --search file by name
map("n", "<leader>fc", ":Rg<cr>") --search word everywhere
-- move between panels
map("n", "<C-j>", "<C-W>j") 
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")





