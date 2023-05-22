-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "nn", ":NERDTreeToggle<cr>")
map("n", "zz", "<ESC>:update<cr>")
map("n", "<C-s>","<C-^>")
map("n", "ff", ":Prettier<cr> | :update | !cargo fmt<cr>")

map("i", "nn", "<ESC>:NERDTreeToggle<cr>")
map("i", "zz", "<ESC>:update<cr>")
map("i", "jj", "<ESC>")
