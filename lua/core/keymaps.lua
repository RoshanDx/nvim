local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- noh - no highlight
vim.keymap.set("n", "<esc>", ":noh<CR>")

-- Normal --
-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts) -- left window
vim.keymap.set("n", "<C-k>", "<C-w>k", opts) -- up window
vim.keymap.set("n", "<C-j>", "<C-w>j", opts) -- down window
vim.keymap.set("n", "<C-l>", "<C-w>l", opts) -- right window

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts) -- Navigate page and center it
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts) -- Navigate page and center it

-- Resize with arrows when using multiple windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<c-down>", ":resize +2<cr>", opts)
vim.keymap.set("n", "<c-right>", ":vertical resize +2<cr>", opts)
vim.keymap.set("n", "<c-left>", ":vertical resize -2<cr>", opts)

-- navigate buffers
vim.keymap.set("n", "<tab>", ":bnext<cr>", opts) -- Next Tab
vim.keymap.set("n", "<s-tab>", ":bprevious<cr>", opts) -- Previous tab
vim.keymap.set("n", "<leader>h", ":nohlsearch<cr>", opts) -- No highlight search

-- move text up and down
--vim.keymap.set("n", "<a-j>", "<esc>:m .+1<cr>==gi", opts) -- Alt-j
--vim.keymap.set("n", "<a-k>", "<esc>:m .-2<cr>==gi", opts) -- Alt-k

-- when seaching text, keep the cursor in the middle
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Copy and keep in the register
vim.keymap.set("x", "<leader>p", '"_dP', opts)

-- insert --
-- press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<esc>", opts) -- Insert mode -> jk -> Normal mode
vim.keymap.set("i", "kj", "<esc>", opts) -- Insert mode -> kj -> Normal mode

-- visual --
-- stay in indent mode
vim.keymap.set("v", "<", "<gv", opts) -- Right Indentation
vim.keymap.set("v", ">", ">gv", opts) -- Left Indentation

-- move text up and down
--vim.keymap.set("v", "<a-j>", ":m .+1<cr>==", opts)
--vim.keymap.set("v", "<a-k>", ":m .-2<cr>==", opts)

-- Visual Block --
-- Move text up and down
--Terminal --
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--Better terminal navigation
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
