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
local luasnip = require("luasnip")
local lspkind = require('lspkind')

require('luasnip.loaders.from_vscode').lazy_load()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "buffer" }, -- text within current buffer
        { name = "path" },   -- file system paths
        { name = 'emoji' },
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 30, ellipsis_char = '...', })
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
    end,
})

-- Debugger
cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
    sources = {
        { name = "dap" },
    },
})
