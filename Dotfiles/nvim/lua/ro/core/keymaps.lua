vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Set the first option as default in autocomplete menu
keymap.set("i", "<CR>", 'pumvisible() ? "\\<C-y><CR>" : "\\<CR>"', { expr = true })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement
--personal ones
keymap.set("n", "<C-s>", "<C-^>jzz") -- toggle last file
keymap.set("i", "<C-s>", "<ESC><C-^>jzz") -- toggle last file
keymap.set("n", "zz", "<Esc>:update<cr>")
--keymap.set("i", "zz", "<Esc>:update<cr>")
keymap.set("n", ";", "<S-$>") -- Go to end of line

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- ZenMode
keymap.set("n", "<leader>zm", "<cmd>ZenMode<CR>", { desc = "Toggle ZenMode" })
keymap.set("n", "j", "jzz", { desc = "Center" })
--keymap.set("n", "n", "kzz", { desc = "Center" })
--

keymap.set("n", "<leader>q", "<cmd>NvimTreeClose<cr>:qa!<cr>", { desc = "Quit all" })
keymap.set("n", "<leader>w", "<cmd>NvimTreeClose<cr>:wqa<cr>", { desc = "Save and quit all" })
keymap.set("n", "<leader>u", "<cmd>source %<cr>", { desc = "Source file" })
