-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
    lsp.buffer_autoformat()
end)

lsp.preset({
    name = 'recommended',
    float_border = 'rounded',
    configure_diagnostics = false,
})

lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.skip_server_setup({ 'jdtls' })

lsp.setup()

-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})
