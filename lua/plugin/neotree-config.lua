require("neo-tree").setup({
    source_selector = {
        winbar = false,
        statusline = false,
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_hidden = false,
        },
    },
    follow_current_file = {
        enabled = focus,
    },
    default_component_configs = {
        indent = {
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
    },
})
