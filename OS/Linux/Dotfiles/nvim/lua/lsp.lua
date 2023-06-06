require("lspconfig")["tsserver"].setup({
    on_attach = function(client, bufnr)
       require("twoslash-queries").attach(client, bufnr)
    end,
})
