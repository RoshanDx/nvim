local lspconfig = require("lspconfig")

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}),
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {}),
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {}),
    -- vim.keymap.set("n", "gr", vim.lsp.buf.references, {}),
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {}),
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
})
