return {
  "smartpde/telescope-recent-files",
  conf = {
    -- Map a shortcut to open the picker.
    vim.api.nvim_set_keymap(
      "n",
      "<Leader>fr",
      [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
      { noremap = true, silent = true }
    ),
  },
}
