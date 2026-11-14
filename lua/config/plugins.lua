vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local plugin = ev.data.spec.name
        local kind = ev.data.kind

        if plugin == "telescope-fzf-native.nvim"
            and (kind == "install" or kind == "update") then

            vim.system(
                { "make" },
                { cwd = ev.data.path }
            ):wait()
        end
    end,
})

vim.pack.add({
    -- Colorscheme
    { src = "https://github.com/folke/tokyonight.nvim" },

    -- Telescope
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },

    -- Tree 
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },

    -- Treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },

    -- Lualine
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },

    -- Mason
    { src = "https://github.com/mason-org/mason.nvim" },

    -- LSP config
    { src = "https://github.com/neovim/nvim-lspconfig" },

    -- Completion
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/windwp/nvim-autopairs" },

    -- Snippets
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("plugins.telescope")
require("plugins.nvim-tree")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.mason")
vim.cmd.packadd("nvim-lspconfig")
require("plugins.cmp")
require("config.lsp")

vim.cmd.colorscheme("tokyonight")
vim.api.nvim_set_hl(0, 'Normal',   { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
