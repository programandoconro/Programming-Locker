return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "mlaursen/vim-react-snippets",
  },
  ---@param opts cmp.ConfigSchema
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    require("vim-react-snippets").lazy_load()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local compare = cmp.config.compare
  end,
}
