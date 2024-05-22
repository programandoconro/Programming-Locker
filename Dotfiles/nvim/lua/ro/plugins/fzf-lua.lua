return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
      winopts = { fullscreen = true, preview = { layout = "horizontal" } },
    })
    vim.keymap.set("n", "<leader>gr", "<cmd>FzfLua lsp_references<cr>", { desc = "LSP references" })
  end,
}
