-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map("n", ",,", ":NERDTreeToggle<cr>")
map("n", "mm", ":Files<cr>")
map("n", "zz", "<ESC>:update<cr>")
map("n", "<C-s>","<C-^>")
map("n", "ff", ":Prettier<cr> | :update | !cargo fmt<cr>")
map("n", "<leader>fc", ":Rg<cr>")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-h>", "<C-W>h")
map("n", "<C-l>", "<C-W>l")

map("i", "zz", "<ESC>:update<cr>")
map("i", "jj", "<ESC>")



