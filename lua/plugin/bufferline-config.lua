-- vim.opt.termguicolors = true
local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup {
    options = {
        hover = {
            enabled = true,
            delay = 150,
            reveal = { 'close' }
        },
        buffer_close_icon = '',
    },
    highlights = {
        buffer_selected = {
            fg = '#9ece6a',
            bold = true,
        },
    },
}
