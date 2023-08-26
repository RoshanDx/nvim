require("tokyonight").setup({
    on_highlights = function(hl, colors)
        hl.CursorLineNr = {
            fg = colors.yellow
        }
    end
})

vim.cmd [[colorscheme tokyonight-storm]] -- Add this line at the end of the file
