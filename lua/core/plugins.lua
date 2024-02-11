return {

    -- Alpha (Dashboard)
    { "goolord/alpha-nvim",        lazy = true },

    -- Which-key Extension
    { "folke/which-key.nvim",      lazy = true },

    -- Bufferline
    { "akinsho/bufferline.nvim",   dependencies = "nvim-tree/nvim-web-devicons" },

    -- Colorscheme
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    { "ellisonleao/gruvbox.nvim",  priority = 1000,                                 config = true },

    -- Lualine
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- File Explorer Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        lazy = true,
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    },

    -- Telescope (Fuzzy Finder)
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
    },

    -- Telescope File Browser
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
    },

    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
        },
    },

    { "rafamadriz/friendly-snippets" },

    -- Autocompletions
    { "hrsh7th/cmp-nvim-lsp" },

    { "onsails/lspkind-nvim" },

    { "williamboman/mason.nvim" },

    { "williamboman/mason-lspconfig.nvim" },

    { "neovim/nvim-lspconfig",            lazy = false },

    { "nvimtools/none-ls.nvim" },

    -- Toggle Term
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },

    -- Auto Pairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {}, -- this is equalent to setup({}) function
    },

    -- Nvim-Surround (Manipulating Surroundings)
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- Undo-Tree
    {
        "jiaoshijie/undotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- Indent-blankline
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },

    -- Git Integration
    { "lewis6991/gitsigns.nvim" },

    -- Todo Comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
    },

    -- Persistence (Session Management)
    --{
    --    "folke/persistence.nvim",
    --    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    --    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" }, },
    --},

    -- Better Vim UI
    { "stevearc/dressing.nvim", opts = {} },

    -- Project fuzzy finder
    {
        "ahmedkhalf/project.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
            require("telescope").load_extension("projects")
        end,
    },

    -- Better command UI
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },

    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
    },

    { "folke/neodev.nvim",      opts = {} },

    { "rmagatti/goto-preview",  opts = {} },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
    },

    {
        "olexsmir/gopher.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },

    { "terrortylor/nvim-comment" },
}
