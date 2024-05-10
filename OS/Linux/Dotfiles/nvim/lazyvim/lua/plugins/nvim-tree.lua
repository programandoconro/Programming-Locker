return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = { { ",,", "[[<cmd>NvimTreeToggle<cr>]]" } },
	view = { adaptive_size = true, auto_expand_width = true },

	auto_expand_width = true,
	config = function()
		require("nvim-tree").setup({})
	end,
}
