require("lspconfig")["yamlls"].setup({
    filetypes = { "yaml", "yml", "yaml.docker-compose" },
    flags = { debounce_test_changes = 150 },
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                printWidth = 120,
            },
            keyOrdering = false,
            hover = true,
            completion = true,
            validate = true,
            schemaStore = {
                enable = false,
                url = "",
            },
        },
    },
})
